<?php

namespace app\api\model;

use think\Model;

class MenuClass extends Model
{
    //

    
    // 获取分类
    public function getNavData()
    {
        return $this->where("is_navdata",1)->field([
            'img as url',
            'name as word'
        ])->select();
    }
}
