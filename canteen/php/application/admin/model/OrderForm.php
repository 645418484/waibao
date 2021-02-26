<?php

namespace app\admin\model;

use app\api\model\Desk;
use app\common\model\User;
use think\Model;


class OrderForm extends Model
{

    

    

    // 表名
    protected $name = 'order_form';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'start_time_text',
        'end_time_text',
        'user_name_text',
        'desk_name_text'
    ];
    

    
    public function getUserNameTextAttr($value, $data)
    {
        return User::where('id',$data['user'])->value('nickname');
    }

    public function getDeskNameTextAttr($value, $data)
    {
        return Desk::where('id',$data['desk_id'])->value('name');
    }




    public function getStartTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['start_time']) ? $data['start_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getEndTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['end_time']) ? $data['end_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setStartTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    protected function setEndTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }


}
