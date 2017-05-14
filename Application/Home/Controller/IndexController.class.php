<?php

namespace Home\Controller;
/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

	//系统首页
    public function index(){

		/*$size = 4047336;
		$bit  = 64;
		$playtime1 = 374;
		$playtime = $size/64/127;
		dump($playtime);
		dump(gmstrftime('%H:%M:%S',$playtime));
		
		die;*/
		$this->getSeoMeta();
		$this->display();       
    }
       
}