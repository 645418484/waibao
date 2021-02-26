<?php

namespace app\api\model;

use think\Model;

class OrderFormInfo extends Model
{
    //
    //获取相关订单信息
    /**
    id: "11",
    url: "//i8.mifile.cn/v1/a1/685330bb-cb82-c3c3-e3cf-106c9b9a70e6!360x360.webp",
    name: "小米平板 4",
    brief: "超长续航，骁龙660AIE",
    price: "1099元起",
    oldPrice: "",
    is_new: false,
    hasDiscount: false,
    discountUrl: ""
        */
    public function getMenuList($order_id)
    {
        $menuModel = model('Menu');
        $list = $this->where('order',$order_id)->select();
        $result = [];
        foreach ($list as $key => $value) {
            //获取商品信息
            $menu_info = $menuModel->find($value['menu']);
            $result[$value['id']] = [
                'id'=> $value['id'],
                'url' => $menu_info['img'],
                'name'=> $menu_info['name'],
                'brief' => $menu_info['brief'],
                'price' => $menu_info['price'],
                'oldPrice' => $menu_info['oldprice'],
                'num'=> $value['num'],
                'is_new'=>false,
                'hasDiscount' =>false,
                'select' => true,
                'discountUrl' => ''
            ];
        }
        return $result;
    }
}
