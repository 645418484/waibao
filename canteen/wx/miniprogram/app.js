//app.js
App({
  onLaunch: function () {
    
    if (!wx.cloud) {
      console.error('请使用 2.2.3 或以上的基础库以使用云能力')
    } else {
      wx.cloud.init({
        traceUser: true,
      })
    }
  },
  globalData: {
    page: 'index',
    _token: null,
    avatarUrl: './user-unlogin.png',
    userInfo: {},
    logged: false,
    //服务器地址
    host:"http://127.0.0.1:8010/"
  },
})
