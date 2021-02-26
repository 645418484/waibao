// miniprogram/pages/category/category.js
const WXAPI = require('../../wxapi/main')
Page({

  /**
   * 页面的初始数据
   */
  data: {
    categroy:[],
    curIndex: 'A',
    toView: 'C',
    // 存入每个list的高度叠加
    heightArr: [],
    // 记录滑动右边时，上一个标签
    lastActive: 'A'
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getCategroy()
  },
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
    // console.log(scrollTop,'88888')
    let find = scrollArr.findIndex(item => {
      // console.log('+++++++',item)
      return scrollTop < item - 50
    })
    // console.log('------',find)
    let charCode = String.fromCharCode(65 + find)
    return charCode
  },
  scrollLower() {
    const scrollArr = this.data.heightArr
    const length = scrollArr.length - 1
    let charCode = String.fromCharCode(65 + length)
    this.setData({
      curIndex: charCode,
      lastActive: charCode
    })
    // console.log('dddd');
  },
  scrollContent(e) {
    // console.log(e)
    let self = this
    const scrollTop = e.detail.scrollTop
    const scrollArr = this.data.heightArr
    // console.log(scrollTop)
    const length = scrollArr.length - 1
    let charCo = String.fromCharCode(65 + length)
    let charCode = this.getCurrentIndex(scrollTop)
    // if(scrollTop >= scrollArr[scrollArr.length - 1]) {
    //   return 
    // } else {
    //   for(let i = 0; i < scrollArr.length; i++) {
    //     // charCode 代表的时当前页面处在那个list中的位置
    //     // 这里为真么要用fromCharCode是因为categroy数据是对象，这就有点尴尬，不能(像数组)取到下标的值
    //     let charCode = String.fromCharCode(65 + i)
    //     if(scrollTop >= 0 && scrollTop < scrollArr[0]) {
    //       if('A' != self.data.lastActive) {
    //         // console.log(i,'-----')
    //         self.setData({
    //           curIndex: 'A',
    //           lastActive: 'A'
    //         })
    //       }
    //     } else if (scrollTop >= scrollArr[i - 1] - 100 && scrollTop < scrollArr[i]) {
    //       if(charCode != self.data.lastActive) {
    //         // console.log(i,'*****')
              // self.setData({
              //   curIndex: charCode,
              //   lastActive: charCode
              // })
              // }
    //     }
    //   }
    // }
          if(this.data.lastActive != charCo) {
            self.setData({
              curIndex: charCode
            })
          } else {
            self.setData({
              lastActive: 'A'
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