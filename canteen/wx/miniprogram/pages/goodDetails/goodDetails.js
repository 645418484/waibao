// miniprogram/pages/goodDetails/goodDetails.js
const WXAPI = require('../../wxapi/main')
const app = getApp();
const http = require('../../utils/http');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    id:'',
    indicatorDots: true,
    autoPlay: true,
    interval: 3000,
    duration: 1000,
    swiper_img:[],
    brief: [],
    defaultData: [],
    details_param: [],
    details_img: [],
    param_img: [],
    state: 'details_img',
    host : "",
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // console.log(options)
    this.setData({
      id: options.id,
      host:app.globalData.host
    })
    this.getGoodDetail()
  },
  getGoodDetail() {
    // 请求服务器
    let postdata = {
    
    }
    http.req('/api/menu/read/id/'+this.data.id,postdata,(res)=>{
      let detail = res.data;
      console.log(detail);
      this.setData({
        id: detail.id,
        swiper_img: [detail.img],
        name: detail.name,
        brief: detail.brief,
        defaultData: {
          "price":detail.price,
          'oldprice' : detail.oldprice
        },
        details_param: "",
        details_img:[detail.img],
        param_img: [detail.img]
      })
    });
  },
  // 按页面传入的id 获取具体的数据
  getSpecific(res) {
    // console.log(res)
    let id = this.data.id
    let detailArr = res.data
    let detail = detailArr.find(item => {
      // console.log(item.id,id)
      return item.id == id
    }) 
    // console.log(detail)
    return detail
  },
  changeState() {
    let state = this.data.state
    if(state === 'details_img') {
      state = 'param_img'
    } else {
      state = 'details_img'
    }
    console.log(state)
    this.setData({
      state
    })
  },
  goSelectGoods() {
    const id = this.data.id
    
    wx.navigateTo({
      url: `../selectGoods/selectGoods?id=${id}`,
    });
      
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