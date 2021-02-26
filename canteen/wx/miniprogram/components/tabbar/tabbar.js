// components/tabbar/tabbar.js
const app =  getApp();
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    on:{
      type: String,
      value: ''
    }
  },

  /**
   * 组件的初始数据
   */
  data: {
  },

  /**
   * 组件的方法列表
   */
  methods: {
    goToPage(e) {
      console.log(app.globalData)
      console.log(app.globalData.page)
      let page = e.currentTarget.dataset.page || 'user';
      console.log(page);
      if(app.globalData.page === page) {
        return ;
      }
      wx.redirectTo({
        url: `/pages/${page}/${page}`,
      });
      // this.setData({
      //   on: page
      // })
      app.globalData.page = page;
    }
  }
})
