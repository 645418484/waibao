// miniprogram/pages/find/find.js
const WXAPI = require('../../wxapi/main')
const app = getApp();
const http = require('../../utils/http');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    findNavData: [],
    findSubjectsData: [],
    img : "/assets/images/canzhuo.png",
    limit : 10,
    page : 1,
    showDialog: false,
    desk_id : 0
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.onGetDesk();
    // this.toggleDialog()
  },
  onGetDesk:function(){
    
    //请求服务器获取餐桌 
    let postdata = {
      limit:this.data.limit,
      page:1
    }
    http.req('/api/Desk/index',postdata,(res)=>{  
      console.log(res);
      this.setData({
        findSubjectsData:res.data
      })
    });
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
  * 控制 pop 的打开关闭
  * 该方法作用有2:
  * 1：点击弹窗以外的位置可消失弹窗
  * 2：用到弹出或者关闭弹窗的业务逻辑时都可调用
  */
 toggleDialog(e) {
  let id = e.currentTarget.dataset.id;
  let now_people = e.currentTarget.dataset.now_people;
  //判断登录
  let info = wx.getStorageSync('userInfo');
  if (typeof info == 'string') {
    wx.redirectTo({
      url: `/pages/user/user?login=false`,
    });
    return false;
  }
  //判断数字
  if (id == 0 || now_people != 0) {
    wx.showToast({
      title: '请选择可用桌号',  // 标题
      icon: 'none',   // 图标类型，默认success
      duration: 1500   // 提示窗停留时间，默认1500ms
    })
    return false;
  }
  this.setData({
    showDialog: !this.data.showDialog,
    desk_id : id
  });

},
jump(){
  wx.redirectTo({
    url: `/pages/user/user.wxml`,
  });
}
,
formSubmit(e) {
  let id = e.currentTarget.dataset.id;
  let now_people = e.currentTarget.dataset.now_people;
  let data = e.detail.value;
  //判断数字
  if (id == 0 && now_people !=0) {
    wx.showToast({
      title: '请选择桌号',  // 标题
      icon: 'none',   // 图标类型，默认success
      duration: 1500   // 提示窗停留时间，默认1500ms
    })
    return false;
  }
  data['desk_id'] = id;
  data['token'] = wx.getStorageSync('backInfo')['userinfo']['token']
  //向服务器发送使用请求
  http.req('/api/Desk/usedesk',data,(res)=>{  
    if (res.code == 1) {
      wx.showToast({
        title: '成功',
        icon: 'success',
        duration: 2000
      })
      //设置缓存
      wx.setStorage({
        data: id,
        key: 'desk_id',
      })
      //成功之后刷新页面
      this.onLoad();
      //关闭弹窗
      this.setData({
        showDialog: false
      });
      //跳转到点餐页面
      wx.navigateTo({
        url: '/pages/category/category'
      })
      // this.setData({
        // findSubjectsData
      // })
    }else{
      wx.showToast({
        title: '失败,请联系店员',
        icon: 'none',
        duration: 2000
      })
    }
  });
  
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
    // this.onGetDesk();
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})