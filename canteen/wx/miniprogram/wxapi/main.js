import * as MOCK from "./mock"
const request = (url, mock = true) => {
  let _url = url
  // console.log(_url)
  return new Promise((resolve, reject) => {
    if (mock) {
      let res = {
        statusCode: 200,
        data: MOCK[_url]
      }
      if (res && res.statusCode === 200 && res.data) {
        resolve(res.data)
      } else {
        // self.alert('提示', res)
        reject(res)
      }
    } else {
      wx.request({
        url: url,
        success(request) {
          resolve(request.data)
        },
        fail(error) {
          reject(error)
        }
      })
    }
  });
}

module.exports = {
  getBanners: () => {
    return request('banners')
  },
  getNavData: () => {
    return request('navdata')
  },
  getGoodList: () => {
    return request('goodList')
  },
  getCategroy: () => {
    return request('category')
  },
  getFindData: () => {
    return request('findData')
  },
  getUserData: () => {
    return request('userData')
  },
  getGoodDetail: () => {
    return request('goodDetail')
  }
}