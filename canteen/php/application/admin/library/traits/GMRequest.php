<?php
namespace app\admin\library\traits;

use app\admin\model\Server;
use fast\Http;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;

/**
 * GM请求
 * Trait GMRequest
 * @package app\admin\library\traits
 */
trait GMRequest{

    //定义是否发送gm请求
    private $is_request_gm = true;

    /**
     * gm请求方式默认http
     * @var string
     */
    public $gmRequestMethod = 'http://';

    /**
     * 发送方法
     * @param int $sid 服务器id
     * @param array|string $param 参数信息
     * @return mixed|string
     */
    public function SendRequest($param,int $sid = null){
        //获取服务器信息
        try {
            //获取服务器标识
            $sid = empty($sid) ? session('server_sid') : $sid;
            //获取服务器信息
            $serverInfo = Server::where("sid = '{$sid}'")->field('ip,gmport')->cache(true)->find();
            //生成url
            $url = "{$this->gmRequestMethod}{$serverInfo['ip']}:{$serverInfo['gmport']}/XKX/gm/";
            //发送请求并返回结果
            return Http::get($url,$param);
        } catch (DataNotFoundException $e){
            $this->error($e->getMessage());
        } catch(ModelNotFoundException $e){
            $this->error($e->getMessage());
        } catch (DbException $e) {
            $this->error($e->getMessage());
        }
    }
}