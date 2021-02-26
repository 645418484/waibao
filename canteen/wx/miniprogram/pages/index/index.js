// miniprogram/pages/index/index.js
const WXAPI = require('../../wxapi/main')
const app = getApp();
const http = require('../../utils/http');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    banners: [],
    indicatorDots: true,
    autoPlay: true,
    interval: 3000,
    duration: 1000,
    navdata: [],
    goodList: [],
    goodListOne: {},
    name:'',
    host:"",
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // this.getBanners()
    // this.getNavData()
    // this.getGoodList()
    this.setData({
      host:app.globalData.host
    })
    //请求服务器获取数据
    //请求服务器
    let postdata = {
    }
    http.req('/api/index/index',postdata,(res)=>{
      console.log(res.data);
      this.setData({
        banners : res.data.banners,
        navdata: res.data.navdata,
        goodListOne: res.data.goodlistone,
        goodList:  res.data.goodlist
      })
    });
  },
  getBanners() {
    WXAPI
    .getBanners()
    .then(res => {
      // console.log(res)
      this.setData({
        banners: res.data
      })
    })
  },
  getNavData() {
    WXAPI
      .getNavData()
      .then(res => {
        this.setData({
          navdata: res.data
        })
      })
  },
  getGoodList() {
    WXAPI
    .getGoodList()
    .then(res => {
      console.log(res)
      this.setData({
        goodListOne: res.one,
        goodList: res.section
      })
    })
  },
  goDetails(e) {
    console.log(e)
    const id = e.currentTarget.dataset.id
    console.log(id)
    wx.navigateTo({
      url: `/pages/goodDetails/goodDetails?id=${id}`,
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