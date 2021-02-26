// miniprogram/pages/category/category.js
const WXAPI = require('../../wxapi/main')
const app = getApp();
const http = require('../../utils/http');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    categroy:[],
    curIndex: 'A',
    toView: 'A',
    // 存入每个list的高度叠加
    heightArr: [],
    // 最后一个list,就是最后一个标签的id
    endActive: 'A',
    host : ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      host:app.globalData.host
    })
    //请求服务器获取菜单
    let postdata = {
    }
    http.req('/api/Menu/index',postdata,(res)=>{  
      console.log(res);
      this.setData({
        categroy: res.data
      })
    });
    // this.getCategroy()
    // console.log(this.data.categroy);
  },
  
  addMenu(e){
    //菜品id
    let id = e.currentTarget.dataset.id;
    let backInfo = wx.getStorageSync('backInfo');
    if (typeof backInfo == 'string') {
      wx.showToast({
        title: '请登录后操作',

      })
      return false;
    }
    let token = backInfo.userinfo.token;
    //判断是否有进行中的订单或者是否登录
    let postdata = {
      menu: id,
      token:token
    }
    http.req('/api/Order/addmenu',postdata,(res)=>{  
      if (res.code == 1) {
        wx.showToast({
          title: '操作成功',
        })
      }else{
        wx.showToast({
          title: '操作失败,请选择桌位',
          icon:"none",
          success:function(){
            setTimeout(function(){
              wx.redirectTo({
                url: '/pages/find/find',
              })
            },1500);
          }
        })
      }
    });
  },
  //加载参数/弃用
  getCategroy() {
    WXAPI
      .getCategroy()
      .then(res => {
        console.log(res)
        this.setData({
          categroy: res.data
        })
      })
  },
  switchTab(e) {
    console.log(e)
    this.setData({
      curIndex: e.target.dataset.index,
      toView: e.target.dataset.index
    })
  },
  // 判断curIndex因该是那个
  getCurrentIndex(scrollTop) {
    const scrollArr = this.data.heightArr
    let find = scrollArr.findIndex(item => {
      // 提前10rpx触发效果
      return scrollTop < item - 10
    })
    let curChar = String.fromCharCode(65 + find)
    return curChar
  },
  // 页面滑动到底部触发
  scrollEnd() {
    const scrollArr = this.data.heightArr
    const length = scrollArr.length - 1
    let endChar = String.fromCharCode(65 + length)
    this.setData({
      curIndex: endChar,
      endActive: endChar
    })
    // console.log('dddd');
  },
  // 页面滑动时触发
  scrollContent(e) {
    const scrollTop = e.detail.scrollTop
    const scrollArr = this.data.heightArr
    // 
    const length = scrollArr.length - 1
    let endChar = String.fromCharCode(65 + length)
    let curChar = this.getCurrentIndex(scrollTop)
    if(this.data.endActive != endChar) {
      this.setData({
        curIndex: curChar
      })
    } else {
      this.setData({
        endActive: 'A'
      })
    }
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    let self = this
    let heightArr = []
    let h = 0
    const query = wx.createSelectorQuery()
    query.selectAll('.right-list').boundingClientRect()
    query.exec( res => {
      console.log(res)
      res[0].forEach( item => {
        h += item.height
        heightArr.push(h)
      })
      self.setData({
        heightArr: heightArr
      })
      console.log(self.data.heightArr)
    })
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})