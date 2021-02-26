# 云开发 quickstart

这是云开发的快速启动指引，其中演示了如何上手使用云开发的三大基础能力：

- 数据库：一个既可在小程序前端操作，也能在云函数中读写的 JSON 文档型数据库
- 文件存储：在小程序前端直接上传/下载云端文件，在云开发控制台可视化管理
- 云函数：在云端运行的代码，微信私有协议天然鉴权，开发者只需编写业务逻辑代码

## 参考文档

- [云开发文档](https://developers.weixin.qq.com/miniprogram/dev/wxcloud/basis/getting-started.html)

##category 页面的问题
 第二个scroll-view 不能改变滑动 的样式
 还有滑动第一个scroll-view    第二个scroll-view也会动，实现效果不好，感觉真的不好.

1. 关于category页面中的scroll-view(右边那个)
   这个空间必须设置高度，否则页面不会解析成scroll-view空间，这是一个很骚的问题
   给第一个text设置伪类，只能使用.right-title text::after
   不能使用.right-list::after 
   用的话会有一个很气怪的现象，自己看
   .categroy-right 这里面的高度也有要求，我设置的是 height: 1130rpx; 这其实也不是真正完美的值,你修改成1200rpx的话，scroll-view点击左边联动右边是，会崩
   **具体可以修改question中的category.wxss**


   "tabBar": {
    "color": "#a6a6a6",
    "selectedColor": "#f96702",
    "backgroundColor": "#ffffff",
    "list": [
      {
        "pagePath": "pages/index/index",
        "text": "首页",
        "iconPath": "./assets/images/index.png",
        "selectedIconPath": "./assets/images/indexSelected.png"
      },
      {
        "pagePath": "pages/category/category",
        "text": "分类",
        "iconPath": "./assets/images/category.png",
        "selectedIconPath": "./assets/images/categorySelected.png"
      },
      {
        "pagePath": "pages/find/find",
        "text": "发现",
        "iconPath": "./assets/images/find.png",
        "selectedIconPath": "./assets/images/findSelected.png"
      },
      {
        "pagePath": "pages/cart/cart",
        "text": "购物车",
        "iconPath": "./assets/images/cart.png",
        "selectedIconPath": "./assets/images/cartSelected.png"
      },
      {
        "pagePath": "pages/user/user",
        "text": "我的",
        "iconPath": "./assets/images/user.png",
        "selectedIconPath": "./assets/images/userSelected.png"
      }
    ],
    "position": "bottom"
  },
