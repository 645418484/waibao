<?php

namespace app\admin\validate;

use think\Validate;

class Desk extends Validate
{
    /**
     * 验证规则
     */
    protected $rule = [
        'desk' => 'require|integer',
        ''
    ];

    /**
     * 字段描述
     */
    protected $field = [
        'desk.require' => '请选择桌号',
        'desk.integer' => '桌号格式错误',
        'desk.require' => '请选择桌号',
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
        'usedesk' => []
    ];

}
