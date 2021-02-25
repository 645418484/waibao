<?php

namespace app\api\controller;

use app\common\controller\Api;

class Menu extends Api
{

    protected $noNeedLogin = ['usedesk','index'];
    protected $noNeedRight = '*';
    protected $likeFields = 'name|author';
    


    /**
     * 获取菜品类别 一次性输出
     *
     * @return void
     */
    public function class()
    {
        $data = collection(model('menu_class')->all());
        
        $this->result($data,1,'','json');
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


    
    /**
     * 将爬取文件下载到本地并修改链接地址
     *
     * @return void
     */
    private function copyImg()
    {
        
        set_time_limit(0);
        //处理数据库菜品
        $menu = model('Menu')->all();
        foreach ($menu as $key => $value) {
            $file = "/uploads/Menu/".pathinfo($value['img'],PATHINFO_BASENAME);
            $this->httpcopy($value['img'],"./uploads/Menu/".pathinfo($value['img'],PATHINFO_BASENAME));
            //修改地址
            $value->img = $file;
            $value->save();
        }
    }
    /**
     * 给菜品生成类别
     *
     * @return void
     */
    private function menucreateclass()
    {
        //给菜分类
        $menu_list = model('Menu')->all();
        
        foreach ($menu_list as $key => $value) {
            $value->class = mt_rand(1,17);
            $value->save();
        }
    }
    //将远程文件下载到服务器
    private function httpcopy($url, $file="", $timeout=60) {
        $file = empty($file) ? pathinfo($url,PATHINFO_BASENAME) : $file;
        $dir = pathinfo($file,PATHINFO_DIRNAME);
        !is_dir($dir) && @mkdir($dir,0755,true);
        $url = str_replace(" ","%20",$url);
        
        if(function_exists('curl_init')) {
          $ch = curl_init();
          curl_setopt($ch, CURLOPT_URL, $url);
          curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
          curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
          $temp = curl_exec($ch);
          if(@file_put_contents($file, $temp) && !curl_error($ch)) {
            return $file;
          } else {
            return false;
          }
        } else {
          $opts = array(
            "http"=>array(
            "method"=>"GET",
            "header"=>"",
            "timeout"=>$timeout)
          );
          $context = stream_context_create($opts);
          if(@copy($url, $file, $context)) {
            //$http_response_header
            return $file;
          } else {
            return false;
          }
        }
      }
}
