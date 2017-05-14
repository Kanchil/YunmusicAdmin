<?php
// +-------------------------------------------------------------+
// | Author: 战神~~巴蒂 <378020023@qq.com> <http://www.jyuu.cn>  |
// +-------------------------------------------------------------+

/**
 * 前台配置文件
 */

$view_conf=include './Data/Conf/home_view.php';

$config = array(

    // 预先加载的标签库
    'TAGLIB_PRE_LOAD'=>    'JYmusic\\TagLib\\JY,JYmusic\\TagLib\\ME',

    /* 数据缓存设置 */
    'DATA_CACHE_PREFIX' => 'jy_', // 缓存前缀
    'DATA_CACHE_TYPE'   => 'File', // 数据缓存类型
    
    /* 模板相关配置  */
    'TMPL_FILE_DEPR'=>'_',
    'VIEW_PATH' => './Template/',    	

    /* SESSION 和 COOKIE 配置 */
    'SESSION_PREFIX' => 'jy_home_', //session前缀
    'COOKIE_PREFIX'  => 'jy_home_', // Cookie前缀 避免冲突

    /* 错误页面模板 */
    'TMPL_ACTION_ERROR'     =>  'Public:error', // 默认错误跳转对应的模板文件
    'TMPL_ACTION_SUCCESS'   =>  'Public:success', // 默认成功跳转对应的模板文件
	//'TMPL_EXCEPTION_FILE'   =>  'Public:exception',// 异常页面的模板文件
	//'URL_MODEL'            => 2, //URL访问模式,可选参数0、1、2、3,代表以下四种模式：// 0 (普通模式); 1 (PATHINFO 模式); 2 (REWRITE  模式); 3 (兼容模式)  默认为PATHINFO 模式
	

	// 定义静态缓存规则 
	'HTML_CACHE_RULES'  => array( 
		'Index'=>array('index'),
		'Music:'=>array('music/{:action}'),
		'Artist:index'=>array('artist'),
		'Artist:'=>array('artist/{:action}'),
		'Album:index'=>array('album'),
		'Album:'=>array('album/{:action}'),
		'Genre:index'=>array('genre'),
		'Genre:'=>array('genre/{:action}'),
		'Ranks'=>array('ranks'),
		'Tag:index'=>array('tag'),
		'Tag:'=>array('tag/{:action}')		
     ) 

);
return array_merge($config,$view_conf);
