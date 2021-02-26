// miniprogram/pages/selectGoods/selectGoods.js
const WXAPI = require('../../wxapi/main');
let versionData = {};
Page({

  /**
   * 页面的初始数据
   */
  data: {
    goodData: {},
    id:'',
    vIndex: "",
    cIndex: "",
    imgSrc: "",
    memory: "",
    color: "",
    price: "",
    priceOld: "",
    selectNum: "1",
    soHave: false,
    stHave: false
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // console.log('id=',options.id)
    this.setData({
      id: options.id
    })
    this.getSelectGoods()
  },
  getSelectGoods() {
    const self = this
    WXAPI
    .getGoodDetail()
    .then(res => {
      // console.log(res)
      const goodData = res.data.filter(item => item.id === self.data.id)[0]
      console.log(goodData)
      versionData = goodData.versionData
      const defaultData = goodData.defaultData
      this.setData({
        goodData,
        imgSrc: defaultData.img,
        memory: defaultData.memory,
        color: defaultData.color,
        price: defaultData.price[0],
        priceOld: defaultData.price[1],
        vIndex: defaultData.vIndex,
        cIndex: defaultData.cIndex
      })
    }) 
  },
  chooseV (e) {
    // console.log(e)
    const vIndex = e.target.dataset.index
    const memory = e.target.dataset.memory
    const price = e.target.dataset.price[0]
    const priceOld = e.target.dataset.price[1]
    this.setData({
      vIndex,
      memory,
      price,
      priceOld
    })
  },
  chooseC (e)  {
    // console.log(e)
    const cIndex = e.target.dataset.index
    const color = e.target.dataset.color
    const imgSrc = e.target.dataset.src  
    this.setData({
      cIndex,
      color,
      imgSrc
    })  
  },
  sOne() {
    const soHave = !this.data.soHave
    this.setData({
      soHave
    })
  },
  sTwo() {
    const stHave = !this.data.stHave
    this.setData({
      stHave
    })
  },
  sNum() {
    let selectNum = this.data.selectNum
    if(selectNum <= 1) {
      return
    }
    selectNum--
    this.setData({
      selectNum
    })
  },
  aNum() {
    let selectNum = this.data.selectNum
    if(selectNum > 98) {
      return
    }
    selectNum++
    this.setData({
      selectNum
    })
  },
  toAddCart() {
    let cartData = wx.getStorageSync('goods') || [];    
    let data = {
      name: this.data.goodData.name,
      memory: this.data.memory,
      color: this.data.color,
      price: this.data.price,
      num: this.data.selectNum,
      img: this.data.imgSrc,
      select: true
    }
    // wx.removeStorageSync('goods');
    cartData.push(data)
    wx.setStorage({
      key: 'goods',
      data: cartData,
      success: (res) => {
        console.log(res)
        wx.showToast({
          title: '添加成功',
          icon: 'success',
          duration: 1500,
          mask: false,
          success: (result) => {
            setTimeout(() => {
              let pageIndex = getCurrentPages()
              let backIndex = pageIndex.length - 2
              wx.navigateBack({
                delta: backIndex
              })
            },1500)
          },
          fail: () => {},
          complete: () => {}
        }); 
      },
      fail: () => {},
      complete: () => {}
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