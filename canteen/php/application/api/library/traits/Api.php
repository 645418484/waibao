<?php

namespace app\api\library\traits;

trait Api
{

    /**
     * 获取餐桌列表
     * 
     * @param int page 分页页数 
     * @param int limit 一页数量 默认10
     *
     * @return void
     */
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
        ->paginate($limit);
        $result = [
            'total' => $list->total(),
            'rows' => $list->items(),
        ];
        $this->result('操作成功',$result,1,'json');
        
    }
}
