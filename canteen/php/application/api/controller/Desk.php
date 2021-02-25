<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\exception\ValidateException;

/**
 * 餐桌操作接口
 */
class Desk extends Api
{
    protected $noNeedLogin = ['usedesk','index'];
    protected $noNeedRight = '*';
    protected $likeFields = '';

    public function _initialize()
    {
        parent::_initialize();
    }


    /**
     * 使用桌子
     *
     * @return void
     */
    public function usedesk()
    {
        if ($this->request->isAjax()) {
            $data = $this->request->param();
            try {   
                //执行验证
                $this->validateFailException(true)->validate($data,$this->request->controller() . '.' . $this->request->action() );
                // 执行逻辑
                $desk = model('Desk')->find($data['desk']);
                if (empty($desk)) {
                    throw new ValidateException("没有这个桌号");
                }
                $desk->lock = 0;
                $desk->people = 10;
                $desk->save();
            } catch (ValidateException $e) {
                $this->error(__("Operation failed"),$e->getMessage());
            } catch (\Throwable $th) {
                $this->error(__("Operation failed"));
            }
        }
    }
}
