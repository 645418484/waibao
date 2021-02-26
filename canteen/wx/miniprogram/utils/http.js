const app = getApp();
function getData(url,data,cb){
    wx.request({
        url : app.globalData.host + url,
        data: data,
        method: 'post',
        header: {
          // "Content-Type": "json",   //get请求时候
          "Content-Type": "application/x-www-form-urlencoded" //POST请求的时候这样写
        },  
        success: function(res){  
            return typeof cb == "function" && cb(res.data)  
        },  
        fail: function(){  
            return typeof cb == "function" && cb(false)  
        }  
    })
}
module.exports = {
    req : getData //暴露一个方法
}