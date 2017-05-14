<?php
// +-------------------------------------------------------------+
// | Author: 战神~~巴蒂 <378020023@qq.com> <http://www.jyuu.cn>  |
// +-------------------------------------------------------------+
namespace User\Controller;
class CenterController extends UserController {
    /**
	* 用户中心首页
	*/    
    public function index(){
    	$this->meta_title = '用户中心 - '.C('WEB_SITE_TITLE');
		$this->display();
    }

}