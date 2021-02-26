// components/userList/userList.js
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    List: {
      type: Object
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
    goJump(e){
      let type = e.currentTarget.dataset.type;
      switch (type) {
        case "我的订单":
          wx.redirectTo({
            url: `/pages/cart/cart`,
          });
          break;
      
        default:
          break;
      }
    }
  }
})
