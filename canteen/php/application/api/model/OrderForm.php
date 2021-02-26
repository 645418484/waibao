<?php

namespace app\api\model;

use think\Model;

class OrderForm extends Model
{
    //
    protected $name = 'order_form';

    /**
     * 订单结束
     *
     * @param [type] $id
     *
     * @return void
     */
    public function OrderOver($id,$sum){
        $info = $this->where('id',$id)->find();
        $info->status = 2;
        $info->end_time = time();
        $info->sum = $sum;
        $info->save();
    }

    public function getStart_timeAttr($value,$data){
        return is_numeric($value) ? date("Y-m-d H:i:s",$value) :$value;
    }

    public function getEnd_timeAttr($value,$data){
        return is_numeric($value) ? date("Y-m-d H:i:s",$value) :$value;
    }
}
