// miniprogram/pages/user/user.js
const WXAPI = require('../../wxapi/main')
const app = getApp();
const http = require('../../utils/http');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    goods:[],
    userData: [],
    setUp: [],
    userName: '用户名',
    userStatus : "登录",
    
    avatarUrl: '../../assets/images/user-unlogin.png',
    userInfo: {},
    logged: false,
    money:0
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    if (typeof options.login == 'string') {
      wx.showToast({
        title: '请登录',
        icon:"none"
      })
    }
    var that = this;
    that.getUserData()
    wx.getStorage({
      key: 'userInfo',
      success (res) {
        that.setData({
          userInfo : res.data,
          logged : true,
          avatarUrl : res.data.avatarUrl ,
          userName:res.data.nickName,
        });
      }
    })
    wx.getStorage({
      key: 'backInfo',
      success (res){
        if (typeof res.data == 'object') {
          
        that.setData({
          money : res.data.userinfo.money
        });
        }
        
        that.getUserData()
      }
    })
  },
  //登录
  onGetUserInfo: function(e) {
    if (!this.data.logged && e.detail.userInfo) {
      console.log(e.detail.userInfo);
      this.setData({
        logged: true,
        avatarUrl: e.detail.userInfo.avatarUrl,
        userInfo: e.detail.userInfo,
        userName:e.detail.userInfo.nickName,
      })
      var that = this
      
      //执行登录
      wx.login({
        success (res) {
          if (res.code) {
            //请求服务器
            let postdata = {
              code:res.code,
              nickname:e.detail.userInfo.nickName
           }
            http.req('/api/User/wxlogin',postdata,(res)=>{  
              console.log(res);
                //将后台信息加入缓存
                let backInfo = res.data;
                wx.setStorage({
                  data: res.data,
                  key: 'backInfo',
                })
                //将后台信息加入缓存
                wx.setStorage({
                  data: e.detail.userInfo,
                  key: 'userInfo',
                })
                that.setData({
                  money:res.data.userinfo.money
                })
                //重新更新页面
                that.getUserData()
              });
          } else {
            console.log('登录失败！' + res.errMsg)
          }
        }
      })
    }
  },
  // 登出
onLoginOut : function(){
  wx.clearStorage()
  this.setData({
    logged: false,
    avatarUrl: '../../assets/images/user-unlogin.png',
    userInfo: [],
    userName: "用户名",
  })
},
//账号销毁
destroy(){
  //判断是否登录
  let info =  wx.getStorage({
    key:'backInfo',
    success:function(res){
      if (typeof info != 'string') {
        //请求服务器
        let postdata = {
          "token":res.data.userinfo.token
        };
       http.req('/api/User/destroy',postdata,(res)=>{  
         if (res.code == 1) {
           wx.showToast({
             title: res.msg,
           })
         }
       });
     }
    }
  })
},

  // 获取界面信息
  getUserData() {
    WXAPI
    .getUserData()
    .then(res => {
      let goods = res.goods;
      goods[0].state = this.data.money+"元"
      this.setData({
        goods: res.goods,
        userData: res.result,
        setUp: res.setUp
      })
    })
  },
})