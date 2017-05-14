<?php
// +-------------------------------------------------------------+
// | Author: 战神~~巴蒂 <378020023@qq.com> <http://www.jyuu.cn>  |
// +-------------------------------------------------------------+
namespace User\Controller;
use Think\Controller;

class EmptyController extends Controller {
	public function index(){  
		$cname = CONTROLLER_NAME; 
		if ((int)$cname){			
			R('Home/index',array($cname));			
		}else{						
			$this->error('你访问的页面不存在');
		}		  
	}    
	
	public function  _empty (){
		$cname	= strtolower(CONTROLLER_NAME);
		$aname	= (int)ACTION_NAME;	
		if ($cname){
			R('Home/'.$cname,array($aname));
		}else{						
			$this->error('你访问的页面不存在');
		}
	}

}