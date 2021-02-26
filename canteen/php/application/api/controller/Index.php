<?php

namespace app\api\controller;

use app\common\controller\Api;

/**
 * 首页接口
 */
class Index extends Api
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    /**
     * 首页 请求
     *
     */
    public function index()
    {
        $MenuModel = model('Menu');
        $goodlist = $MenuModel->getGoodList();
        $goodlistone = array_shift($goodlist);
        $result = array(
            //简单分类 
            //NavData
            'navdata' => model('MenuClass')->getNavData(),
            //人气推荐
            //Goodlist
            'goodlistone' => $goodlistone,
            'goodlist' => $goodlist,
            //轮播图 //获取热菜
            // banners
            'banners' => $MenuModel->getBanners(),
        );
        $this->result('操作成功',$result,1);
    }
}
