<?php
namespace Api\Controller;
use Think\Controller;
/**
 * 基础控制器类
 */
class BaseController extends Controller
{

  function __construct()
  {
    # code...
  }
  const JSON = 'json';  //定义一个常亮
  /**
  * $code 状态码   200 成功    400 失败
  * $message 提示信息
  * $data 数据
  */
  public static function dataShow($code,$message='',$data=array(),$type=self::JSON){
		if(!is_numeric($code)){
			return '';
		}
		$type = isset($_GET['format']) ? $_GET['format'] : self::JSON;
		$result = array(
			'code'=>$code,
			'message'=>$message,
			'data'=>$data
		);
		if($type == 'json'){
			self::json($code,$message,$data);
			exit;
		}else{
			echo "抱歉，暂时未提供此种数据格式";
		}
	}

}

 ?>
