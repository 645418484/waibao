<?php

namespace app\api\controller;

use app\admin\model\User;
use app\common\controller\Api;
use think\Request;

class Order extends Api
{
    protected $noNeedRight = '*';
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //获取订单列表  如果有进行中的订单显示进行中的  否则获取全部订单
        $info = $this->auth->getUserinfo();
        $OrderFormModel =model('OrderForm');
        $order = $OrderFormModel->where('user',$info['id'])->where('status',1)->find();
        if ($order) {
            $order['start_time'] = is_numeric($order['start_time']) ? date('Y-m-d H:i:s',$order['start_time']) : $order['start_time'];
            $order['end_time'] = is_numeric($order['end_time']) ? date('Y-m-d H:i:s',$order['end_time']) : $order['end_time'];
            //如果有进行中的订单
            $order['desk_name'] = model('Desk')->where('id',$order['desk_id'])->value('name');
            $result = [
                'now'=> $order,
                'menu_list' => model('OrderFormInfo')->getMenuList($order['id']),
                'status'=>1
            ];
            $this->result('操作成功',$result,1);
        }else{
            $DeskModel = model('Desk');
            $DeskInfoModel = model("OrderFormInfo");
            $MenuModel = model("Menu");
            //其他情况下显示订单
            $list = $OrderFormModel->where('user',$info['id'])->where('status',2)->select();
            foreach ($list as $key => &$value) {
                $desk_info = $DeskModel->find($value['desk_id']);
                $MenuList = $DeskInfoModel->where('order',$value['id'])->select();
                foreach ($MenuList as $key => &$val) {
                    $menuInfo = $MenuModel->where('id',$val['menu'])->find();
                    $val['name'] = $menuInfo['name'];
                    $val['price'] = $menuInfo['price'];
                }
                $value['name']= $desk_info['name'];
                $value['menu_list'] = $MenuList;
            }
            $result = [
                'status' => 2,
                'list' => $list
            ];
            $this->result('操作成功',$result,1);
        }
    }

    
    /**
     * 结算订单
     *
     * @return void
     */
    public function suborder()
    {
        //只需要获取桌号
        $deskId = $this->request->param('desk_id');
        $userInfo = $this->auth->getUserinfo();
        //获取该桌订单信息并判断余额是否足够
        $orderInfo = model("OrderForm")->where('desk_id',$deskId)->where('status',1)->where('user',$userInfo['id'])->find()->toArray();
        //获取菜单
        $menuInfo = model("OrderFormInfo")->where('order',$orderInfo['id'])->select();
        $sum = 0;
        $MenuModel = model("Menu");
        //计算总金额
        foreach ($menuInfo as $key => $value) {
            $menuInfo = $MenuModel->find($value['menu'])->toArray();
            $sum += $menuInfo['price'] * $value['num'];
        }
        //判断该卓账号是否有足够金额
        if ($userInfo['money'] > $sum) {
            //如果钱足够
            $this->auth->getUser()->where("id",$userInfo['id'])->setDec('money',$sum);
            //把该卓做清洁
            model('Desk')->DeskOver($deskId);
            //订单完结
            model('OrderForm')->OrderOver($orderInfo['id'],$sum);
            $this->result('操作成功',null,1);
        }else{
            //钱不够返货消息
            $this->result('余额不够',null,0);
        }

    }

    public function addmenu()
    {
        //判断参数
        $data = $this->request->param();
        if (isset($data['menu'])) {
            $userInfo = $this->auth->getUserinfo();
            $OrderInfo = model("OrderForm")->where([
                'status'=>1,
                'user'=>$userInfo['id'],
            ])->find();
            if ($OrderInfo) {
                //执行加菜
                model('OrderFormInfo')->save([
                    'order'=> $OrderInfo['id'],
                    'menu'=> $data['menu'],
                    'num'=>1,
                ]);
                $this->result('操作成功',null,1);
            }
        }
        $this->result('操作失败',null,0);
    }
    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
