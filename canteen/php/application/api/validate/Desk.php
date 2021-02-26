<?php

namespace app\api\validate;

use think\Validate;

class Desk extends Validate
{
    /**
     * 验证规则
     */
    protected $rule = [
        'desk_id' => 'require|integer',
        'now_people' => 'require|integer',
    ];

    /**
     * 字段描述
     */
    protected $field = [
        'desk_id.require' => '请选择桌号',
        'desk_id.integer' => '桌号格式错误',
        'now_people.require' => '请选择人数',
        'now_people.integer' => '人数错误',
    ];
    /**
     * 提示消息
     */
    protected $message = [
    ];
    /**
     * 验证场景
     */
    protected $scene = [
        'usedesk' => ['desk_id','now_people']
    ];

}
