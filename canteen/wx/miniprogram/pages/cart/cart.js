// miniprogram/pages/cart/cart.js

const app = getApp();
const http = require('../../utils/http');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    hasCart: false,
    cartgoods:[],
    selectAll: true,
    totalPrice: '',
    listOrder:[],
    status : 0,
    showDialog: false,
    nickname:''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  //判断登录
  let info = wx.getStorageSync('backInfo');
  let wxinfo = wx.getStorageSync('userInfo')
  console.log(wxinfo);
  console.log(info);
  if (typeof info == 'object' && typeof wxinfo != 'undefined') {
    //请求服务器获取订单数据
    let postdata = {
      token: info.userinfo.token
    }
    http.req('/api/Order/index',postdata,(res)=>{  
      console.log(res);
      if (res.code == 1) {
        if (res.data.status == 2) {
          //没有进行订单
          this.setData({
            listOrder:res.data.list,
            status: 2,
            hasCart : true,
          })
        }else if (res.data.status == 1) {
          console.log(2);
          //有进行订单
          this.setData({
            cartgoods:res.data.menu_list,
            status: 1,
            hasCart : true,
            nickname:wxinfo.nickName,
            desk_id:res.data.now.desk_id,
            deskname : res.data.now.desk_name,
          })
          this.getTotalPrice()
        }
      }
    });
  }
  },
  //计算金额
  getTotalPrice() {
    let cartgoods = this.data.cartgoods
    let total = 0;
    console.log(cartgoods);
    for (var index in cartgoods) {
      console.log(cartgoods[index]);
      total += parseInt(cartgoods[index].price * cartgoods[index].num);
   }
    this.setData({
      totalPrice:total
    })
  },
  
  /**
  * 控制 pop 的打开关闭
  * 该方法作用有2:
  * 1：点击弹窗以外的位置可消失弹窗
  * 2：用到弹出或者关闭弹窗的业务逻辑时都可调用
  */
 toggleDialog(e) {
  this.setData({
    showDialog: !this.data.showDialog,
  });

},
//表单提交
formSubmit(e) {
  let id = e.currentTarget.dataset.id;
  console.log(id);
  let backInfo = wx.getStorageSync('backInfo')
  console.log(backInfo);
  //判断数字
  if (id == 0) {
    wx.showToast({
      title: '请选择桌号',  // 标题
      icon: 'none',   // 图标类型，默认success
      duration: 1500   // 提示窗停留时间，默认1500ms
    })
    return false;
  }
  let data = {};
  data['desk_id'] = id;
  data['token'] = backInfo.userinfo.token
  //向服务器发送使用请求
  http.req('/api/Order/suborder',data,(res)=>{  
    if (res.code == 1) {
      wx.showToast({
        title: '成功',
        icon: 'success',
        duration: 2000,
        mask:true,
        success:function(){
          setTimeout(function(){
          wx.redirectTo({
            url: `/pages/user/user`,
          });
          },1500);
        }
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
  settlement:function(){

  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

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