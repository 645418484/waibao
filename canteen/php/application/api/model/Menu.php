<?php

namespace app\api\model;

use think\Model;

class Menu extends Model
{
    protected $name = 'menu';

    //获取人气菜品
    public function getGoodList()
    {
        return $this->where("is_goodlist",1)->select();
    }
    //获取轮播菜品
    public function getBanners()
    {
        return $this->where("is_banner",1)->select();
    }

}
