<?php

namespace app\api\model;

use think\Model;

class Desk extends Model
{
    //
    // 当前模型名称
    protected $name = "desk";

    /**
     * 桌子使用完成
     */
    public function DeskOver($id){
        $info = $this->find($id);
        $info->lock = 0;
        $info->now_people = 0;
        $info->save();
    }
}
