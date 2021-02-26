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

    public function index()
    {
        
        $limit = $this->request->param('limit',10);
        //条件搜索
        $where = $this->request->param('where',null);
        
        $list = model($this->request->controller())
        ->where(function($query)use($where){
            if ($where) {
                $query->whereLike($this->likeFields,$where);
            }
        })
        ->order('now_people',"asc")
        ->select();
        $result = [];
        foreach ($list as $key => $value) {
            $result[$value['id']] =$value;
        }
        $this->result('操作成功',$result,1,'json');
    }

    /**
     * 使用桌子
     *
     * @return void
     */
    public function usedesk()
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();
            try {   
                //执行验证
                $this->validateFailException(true)->validate($data,$this->request->controller() . '.' . $this->request->action() );
                $userInfo = $this->auth->getUserinfo();
                // 执行逻辑
                $desk = model('Desk')->where('now_people',0)->find($data['desk_id']);
                if (empty($desk)) {
                    throw new ValidateException("没有这个桌号,或次桌号正在被使用");
                }
                $desk->lock = 0;
                $desk->now_people = $data['now_people'];
                $desk->save();
                //生成订单
                model("OrderForm")->save([
                    'desk_id' => $data['desk_id'],
                    'user' => $userInfo['id'],
                    'status' => 1,
                    'start_time' => time()
                ]);
                $this->success();
            } catch (ValidateException $e) {
                $this->error(__("Operation failed"),$e->getMessage());
            }
            $this->error(__("Operation failed"),null);
        }
    }
}
