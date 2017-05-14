
--
-- 表的结构 `jy_action`
--

DROP TABLE IF EXISTS `jy_action`;

CREATE TABLE IF NOT EXISTS `jy_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `jy_action`
--

INSERT INTO `jy_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `jy_action_log`
--
DROP TABLE IF EXISTS `jy_action_log`;

CREATE TABLE IF NOT EXISTS `jy_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_addons`
--

DROP TABLE IF EXISTS `jy_addons`;

CREATE TABLE IF NOT EXISTS `jy_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `jy_addons`
--

INSERT INTO `jy_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(1, 'Slider', '幻灯片', '幻灯片插件', 1, '{"height":"300px","width":"100%","Speed":"3000","animationTime":"3000","animation":"slide","slideshow":"true","show_model":"3"}', 'JYmusic', '0.1', 1465492758, 1),
(3, 'Baidushare', '百度分享', '网站内容分享到第三方网站,带来社会化流量。', 1, '{"openbutton":"1","buttonlist":["qzone","tsina","tqq","weixin","renren","tieba"],"button_size":"16","openimg":"0","imglist":["qzone","tsina","tqq","weixin","renren","tieba"],"img_size":"16","openselect":"0","selectlist":["qzone","tsina","tqq","weixin","renren","tieba"]}', 'JYmusic', '0.1', 1465494369, 0),
(4, 'Links', '友情连接', '友情连接插件', 1, '{"link_type":"1"}', 'JYmusic', '0.1', 1465494404, 1),
(12, 'Ads', '广告', '投放广告管理插件', 1, 'null', 'JYmusic', '0.1', 1467245110, 1),
(7, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_markdownpreview":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.2', 1465702007, 0),
(8, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"3","editor_wysiwyg":1,"editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1465702441, 0),
(9, 'SyncLogin', '第三方登录', '第三方账号同步登录', 1, '{"type":null,"meta":"","QqKEY":"","QqSecret":"","SinaKEY":"","SinaSecret":"","DoubanKEY":"","DoubanSecret":""}', 'JYmusic', '0.1', 1465706281, 0),
(10, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，支持网站同步登录用户。', 1, '{"comment_type":"1","comment_appid_changyan":"cys8RGDlP","comment_appkey_changyan":"c1b414a335df0ebcd92e7388c91c98ea","comment_css_changyan":"#powerby_sohu a{font-size:0!important;line-height:0!important}\\r\\n#changyan_floatbar_wrapper{display:none!important}\\r\\n#SOHUCS #SOHU_MAIN .section-list-w .list-comment-empty-w .empty-prompt-w .prompt-null-b {\\r\\n    background-color: #fbfbfb;\\r\\n    color: #e73c31;\\r\\n}","comment_uid_youyan":"1972191","comment_key_youyan":"JYmusicUy","comment_css_youyan":"#uyan_frame #uyan_cmty_btn,\\r\\n#uyan_frame #uyan_ottype,\\r\\n#uyan_frame #uyan_sort_tsina,\\r\\n#uyan_frame #uyan_sort_tqq{display: none !important;}\\r\\n","comment_short_name_duoshuo":"jymusic","comment_form_pos_duoshuo":"buttom","comment_data_list_duoshuo":"10","comment_data_order_duoshuo":"asc","comment_css_duoshuo":"#ds-thread #ds-sync-checkbox,#ds-thread .ds-powered-by,ds-unread-#ds-thread  .comments-count{display: none !important;}"}', 'JYmusic', '0.1', 1465706313, 0),
(14, 'Pay', '支付插件', '支付插件', 1, '{"pay_type":["alipay"],"pay_ratio":"10","alipay_partner":"45645","alipay_key":"5464","alipay_seller_email":"5456456"}', 'JYmusic', '0.1', 1467456868, 0),
( 15, 'Justup', '第三方上传驱动', 'FTP 阿里OSS、等上传驱动。', '1', '{"up_on":"0","up_type":"2","ftp_host":"","ftp_user":"","ftp_pwd":"","ftp_port":"21","alioss_id":"","alioss_key":"","alioss_host":"","alioss_bucket":"","alioss_dir":"","qiniu_ak":"","qiniu_sk":"","qiniu_bucket":"","comment_css_duoshuo":""}', 'JYmusic', '0.1', '1468517108', '0');
-- --------------------------------------------------------

--
-- 表的结构 `jy_ads`
--

DROP TABLE IF EXISTS `jy_ads`;

CREATE TABLE IF NOT EXISTS `jy_ads` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告名称',
  `position` int(11) NOT NULL COMMENT '广告位置',
  `advspic` int(11) NOT NULL COMMENT '图片地址',
  `advstext` text NOT NULL COMMENT '文字广告内容',
  `advshtml` text NOT NULL COMMENT '代码广告内容',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `jy_ads`
--

INSERT INTO `jy_ads` (`id`, `title`, `position`, `advspic`, `advstext`, `advshtml`, `link`, `level`, `status`, `create_time`, `end_time`) VALUES
(4, '通栏1', 4, 0, '', '<div style="margin-bottom:15px "><a href="http://jyuu.cn"><img width="100%" src="/Public/static/images/index-ad.jpg"></a></div>', '', 1, 1, 1452127500, 1519865100),
(5, '播放页右侧', 5, 0, '', '<div style="margin-bottom:15px "><a href="http://jyuu.cn"><img width="100%" src="/Public/static/images/sad.jpg"></a></div>', '', 1, 1, 1452127560, 1615423560),
(8, '右侧上', 8, 0, '', '<div style="margin-bottom:15px "><a href="http://jyuu.cn"><img width="100%" src="/Public/static/images/sad.jpg"></a></div>', '', 0, 1, 1454349000, 1594230600),
(9, '右侧下', 9, 0, '', '<div style="margin-bottom:15px "><a href="http://jyuu.cn"><img width="100%" src="/Public/static/images/sad.jpg"></a></div>', '', 0, 1, 1454521860, 1929894660);

-- --------------------------------------------------------

--
-- 表的结构 `jy_advertising`
--

DROP TABLE IF EXISTS `jy_advertising`;

CREATE TABLE IF NOT EXISTS `jy_advertising` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置展示方式  0为默认展示一张',
  `width` char(20) NOT NULL DEFAULT '' COMMENT '广告位置宽度',
  `height` char(20) NOT NULL DEFAULT '' COMMENT '广告位置高度',
  `mark` char(140) NOT NULL DEFAULT '' COMMENT '广告位置标示',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告位置表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `jy_advertising`
--

INSERT INTO `jy_advertising` (`id`, `title`, `type`, `width`, `height`, `mark`, `status`) VALUES
(4, '首页通栏广告', 4, '100%', 'auto', 'index_center', 1),
(5, '播放页右侧上', 4, '100%', '180', 'play_right_up', 1),
(6, '播放页右侧下', 4, '100%', '180', 'play_right_down', 1),
(8, '右侧上', 4, '100%', '180', 'right_up', 1),
(9, '右侧下', 4, '100%', '180', 'right_down', 1);

-- --------------------------------------------------------

--
-- 表的结构 `jy_album`
--

DROP TABLE IF EXISTS `jy_album`;

CREATE TABLE IF NOT EXISTS `jy_album` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type_name` varchar(100) NOT NULL DEFAULT '其它',
  `genre_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `genre_name` varchar(100) DEFAULT NULL,
  `artist_id` int(10) unsigned NOT NULL DEFAULT '0',
  `artist_name` varchar(100) DEFAULT NULL,
  `add_uid` int(10) NOT NULL DEFAULT '0' COMMENT '创建者的ID',
  `add_uname` varchar(100) DEFAULT NULL COMMENT '创建者名称',
  `sort` varchar(1) DEFAULT '',
  `company` text,
  `pub_time` varchar(100) NOT NULL DEFAULT '未知',
  `cover_id` int(11) NOT NULL DEFAULT '0',
  `cover_url` varchar(255) DEFAULT NULL COMMENT '封面地址',
  `recommend` int(11) NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `rater` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '评分',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `favtimes` mediumint(8) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `likes` mediumint(8) NOT NULL DEFAULT '0' COMMENT '喜欢',
  `position` smallint(6) NOT NULL DEFAULT '0' COMMENT '推荐位',
  `introduce` mediumtext,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '专辑状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_album_type`
--

DROP TABLE IF EXISTS `jy_album_type`;

CREATE TABLE IF NOT EXISTS `jy_album_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `jy_album_type`
--

INSERT INTO `jy_album_type` (`id`, `name`, `description`, `add_time`, `update_time`) VALUES
(1, '国语专辑', '', 0, 0),
(2, '欧美专辑', '', 0, 0),
(3, '日韩专辑', '', 0, 0),
(4, 'DJ舞曲', '', 0, 0),
(5, 'JYmusic精选', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `jy_artist`
--

DROP TABLE IF EXISTS `jy_artist`;

CREATE TABLE IF NOT EXISTS `jy_artist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `type_id` smallint(8) unsigned NOT NULL DEFAULT '1',
  `sort` varchar(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `cover_id` int(11) NOT NULL DEFAULT '0',
  `cover_url` varchar(255) DEFAULT NULL COMMENT '封面地址',
  `region` varchar(255) NOT NULL DEFAULT '内地',
  `region_id` int(6) NOT NULL DEFAULT '1',
  `rater` tinyint(2) NOT NULL DEFAULT '0' COMMENT '评分',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `favtimes` mediumint(8) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `likes` mediumint(8) NOT NULL DEFAULT '0' COMMENT '喜欢次数',
  `position` smallint(6) NOT NULL DEFAULT '0' COMMENT '推荐位',
  `recommend` tinyint(2) NOT NULL DEFAULT '0',
  `introduce` text,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_artist_type`
--

DROP TABLE IF EXISTS `jy_artist_type`;

CREATE TABLE IF NOT EXISTS `jy_artist_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `jy_artist_type`
--

INSERT INTO `jy_artist_type` (`id`, `name`, `description`, `add_time`, `update_time`, `status`) VALUES
(1, '华语男歌手', '', 1342360846, 0, 1),
(2, '华语女歌手', '', 1342360846, 0, 1),
(3, '华语组合', '', 1342360846, 0, 1),
(4, '日韩男歌手', '', 1342360846, 0, 1),
(5, '日韩女歌手', '', 1342360846, 0, 1),
(6, '日韩组合', '', 1342360846, 0, 1),
(7, '欧美男歌手', '', 1342360846, 0, 1),
(8, '欧美女歌手', '', 1342360846, 0, 1),
(9, '欧美组合', '', 1342360846, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jy_attachment`
--

DROP TABLE IF EXISTS `jy_attachment`;

CREATE TABLE IF NOT EXISTS `jy_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_attribute`
--

DROP TABLE IF EXISTS `jy_attribute`;

CREATE TABLE IF NOT EXISTS `jy_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `jy_attribute`
--

INSERT INTO `jy_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '推荐文件到指定的推荐位', 1, '[DOCUMENT_POSITION]', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '上传封面', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(28, 'content', '文档内容', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1450800521, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `jy_auth_extend`
--

DROP TABLE IF EXISTS `jy_auth_extend`;

CREATE TABLE IF NOT EXISTS `jy_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `jy_auth_extend`
--

INSERT INTO `jy_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jy_auth_group`
--

DROP TABLE IF EXISTS `jy_auth_group`;

CREATE TABLE IF NOT EXISTS `jy_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `jy_auth_group`
--

INSERT INTO `jy_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '音乐管理组', '负责管理音乐', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '资讯管理组', '负责管理资讯', 1, '1'),
(4, 'home', 1, '普通会员', '注册的普通会员', 1, ''),
(5, 'home', 1, '收费会员', '你懂得', 1, ''),
(3, 'admin', 1, '用户管理组', '负责管理用户', 1, ''),
(6, 'user', 1, '认证音乐人', '你懂得', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `jy_auth_group_access`
--

DROP TABLE IF EXISTS `jy_auth_group_access`;

CREATE TABLE IF NOT EXISTS `jy_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jy_auth_rule`
--
DROP TABLE IF EXISTS `jy_auth_rule`;

CREATE TABLE IF NOT EXISTS `jy_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=288 ;

--
-- 转存表中的数据 `jy_auth_rule`
--

INSERT INTO `jy_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '内容', -1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', -1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/Article/index', '内容', 1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, ''),
(217, 'admin', 1, 'Admin/think/lists', '数据列表', 1, ''),
(218, 'admin', 1, 'Admin/Songs/index', '歌曲管理', 1, ''),
(219, 'admin', 1, 'Admin/Songs/add', '添加', 1, ''),
(220, 'admin', 1, 'Admin/Album/add', '添加', 1, ''),
(221, 'admin', 1, 'Admin/Singer/add', '添加', -1, ''),
(222, 'admin', 1, 'Admin/Genre/add', '添加', 1, ''),
(223, 'admin', 1, 'Admin/Songs/mod', '修改', 1, ''),
(224, 'admin', 1, 'Admin/Album/index', '专辑管理', 1, ''),
(225, 'admin', 1, 'Admin/Singer/mod', '修改', -1, ''),
(226, 'admin', 1, 'Admin/Genre/mod', '修改', 1, ''),
(227, 'admin', 1, 'Admin/AlbumType/add', '添加', 1, ''),
(228, 'admin', 1, 'Admin/SingerType/add', '添加', -1, ''),
(229, 'admin', 2, 'Admin/Songs/index', '音乐', 1, ''),
(230, 'admin', 1, 'Admin/Songs/del', '删除', 1, ''),
(231, 'admin', 1, 'Admin/Album/mod', '修改', 1, ''),
(232, 'admin', 1, 'Admin/Singer/index', '歌手管理', -1, ''),
(233, 'admin', 1, 'Admin/Singer/del', '删除', -1, ''),
(234, 'admin', 1, 'Admin/Genre/del', '删除', 1, ''),
(235, 'admin', 1, 'Admin/AlbumType/mod', '修改', 1, ''),
(236, 'admin', 1, 'Admin/SingerType/mod', '修改', -1, ''),
(237, 'admin', 1, 'Admin/Songs/clear', '清空', -1, ''),
(238, 'admin', 1, 'Admin/Album/del', '删除', 1, ''),
(239, 'admin', 1, 'Admin/Genre/index', '曲风管理', 1, ''),
(240, 'admin', 1, 'Admin/AlbumType/del', '删除', 1, ''),
(241, 'admin', 1, 'Admin/SingerType/del', '删除', -1, ''),
(242, 'admin', 1, 'Admin/AlbumType/index', '专辑类型', 1, ''),
(243, 'admin', 1, 'Admin/SingerType/index', '歌手类型管理', -1, ''),
(244, 'admin', 1, 'Admin/Config/cache', '缓存静态', 1, ''),
(245, 'admin', 1, 'Admin/Songs/bulkImport', '批量导入', 1, ''),
(246, 'admin', 1, 'Admin/songs/audit', '审核歌曲', 1, ''),
(247, 'admin', 1, 'Admin/Artist/add', '添加', 1, ''),
(248, 'admin', 1, 'Admin/Message/index', '信息管理', 1, ''),
(249, 'admin', 1, 'Admin/Message/add', '添加信息', 1, ''),
(250, 'admin', 1, 'Admin/Server/add', '添加服务器', 1, ''),
(251, 'admin', 1, 'Admin/Server/mod', '修改服务器', 1, ''),
(252, 'admin', 1, 'Admin/Artist/mod', '修改', 1, ''),
(253, 'admin', 1, 'Admin/Artist/index', '艺术家管理', 1, ''),
(254, 'admin', 1, 'Admin/Artist/del', '删除', 1, ''),
(255, 'admin', 1, 'Admin/ArtistType/index', '艺术家类型', 1, ''),
(256, 'admin', 1, 'Admin/Server/index', '服务器管理', 1, ''),
(257, 'admin', 2, 'Admin/Songs/index1', '音乐', -1, ''),
(258, 'admin', 1, 'Admin/Songs/ recycle', '回收站', -1, ''),
(259, 'admin', 1, 'Admin/Audit/index', '音乐审核', 1, ''),
(260, 'admin', 1, 'Admin/ArtistType/add', '添加', 1, ''),
(261, 'admin', 1, 'Admin/ArtistType/mod', '修改', 1, ''),
(262, 'admin', 1, 'Admin/ArtistType/del', '删除', 1, ''),
(263, 'admin', 1, 'Admin/Recycle/clear', '清空', 1, ''),
(264, 'admin', 1, 'Admin/Recycle/index', '回收站', 1, ''),
(265, 'admin', 1, 'Admin/Tag/add', '新增标签', 1, ''),
(266, 'admin', 1, 'Admin/Tag/mod', '修改标签', 1, ''),
(267, 'admin', 1, 'Admin/Tag/del', '删除标签', 1, ''),
(268, 'admin', 1, 'Admin/Tag/index', '标签管理', 1, ''),
(269, 'admin', 1, 'Admin/Config/updrive', '上传驱动', 1, ''),
(270, 'admin', 1, 'Admin/Config/view', '视图配置', 1, ''),
(271, 'admin', 1, 'Admin/Profile/group', '资料扩展', -1, ''),
(272, 'admin', 1, 'Admin/Profile/addgroup', '新增资料组', 1, ''),
(273, 'admin', 1, 'Admin/Profile/modgroup', '修改资料组', 1, ''),
(274, 'admin', 1, 'Admin/Profile/memberfield', '字段管理', 1, ''),
(275, 'admin', 1, 'Admin/Profile/addfield', '添加字段', 1, ''),
(276, 'admin', 1, 'Admin/Profile/modfield', '修改字段', 1, ''),
(277, 'admin', 1, 'Admin/Profile/delfield', '删除字段', 1, ''),
(278, 'admin', 1, 'Admin/Seo/add', '新增SEO规则', 1, ''),
(279, 'admin', 1, 'Admin/Seo/mod', '修改Seo规则', 1, ''),
(280, 'admin', 1, 'Admin/Seo/del', '删除SEO规则', 1, ''),
(281, 'admin', 1, 'Admin/Songs/addall', '快速新增', 1, ''),
(282, 'admin', 1, 'Admin/User/updateUsername', '修改用户名', 1, ''),
(283, 'admin', 1, 'Admin/Seo/index', 'SEO管理', 1, ''),
(284, 'admin', 1, 'Admin/Email/index', '邮件配置', 1, ''),
(285, 'admin', 1, 'Admin/UserGroup/index', '用户组管理', 1, ''),
(286, 'admin', 1, 'Admin/UserGroup/add', '添加用户组', 1, ''),
(287, 'admin', 1, 'Admin/UserGroup/mod', '修改用户组', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `jy_category`
--
DROP TABLE IF EXISTS `jy_category`;

CREATE TABLE IF NOT EXISTS `jy_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `jy_category`
--

INSERT INTO `jy_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`) VALUES
(1, 'yule', '娱乐', 0, 0, 10, '', '', '', '', '', '', '', '2', '', '2,1,3', 0, 1, 1, 1, 0, '', '', 1467152327, 1467152327, 1, 0),
(2, 'neidi', '内地星闻', 1, 0, 10, '', '', '', '', '', '', '', '2', '', '2,1,3', 0, 1, 1, 1, 0, '', '', 1467152378, 1467152378, 1, 0),
(3, 'gangtai', '港台星闻', 1, 0, 10, '', '', '', '', '', '', '', '2', '', '2,1,3', 0, 1, 1, 1, 0, '', '', 1467152402, 1467152402, 1, 0),
(4, 'haiwai', '海外星闻', 1, 0, 10, '', '', '', '', '', '', '', '2', '', '2,1,3', 0, 1, 1, 1, 0, '', '', 1467152422, 1467152431, 1, 0),
(5, 'toutiao', '头条', 0, 0, 10, '', '', '', '', '', '', '', '2', '', '2,1,3', 0, 1, 1, 1, 0, '', '', 1467152598, 1467152598, 1, 0),
(6, 'bagua', '八卦', 0, 0, 10, '', '', '', '', '', '', '', '2', '', '2,1,3', 0, 1, 1, 1, 0, '', '', 1467152632, 1467152632, 1, 0),
(7, 'baoliao', '爆料', 0, 0, 10, '', '', '', '', '', '', '', '2', '', '2,1,3', 0, 1, 1, 1, 0, '', '', 1467152661, 1467152661, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `jy_channel`
--
DROP TABLE IF EXISTS `jy_channel`;

CREATE TABLE IF NOT EXISTS `jy_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `jy_channel`
--

INSERT INTO `jy_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '首页', '/', 1, 1430851833, 1463248458, 1, 0),
(2, 0, '专辑', '/album', 2, 1430851833, 1467362889, 1, 0),
(3, 0, '艺术家', '/artist', 3, 1430851833, 1467362897, 1, 0),
(4, 0, '歌曲分类', '/genre', 4, 1430851833, 1467505873, 1, 0),
(5, 0, '歌曲标签', '/tag', 5, 1430851833, 1467362913, 1, 0),
(6, 0, '歌曲排行', '/ranks', 8, 1453186436, 1467362939, 1, 0),
(7, 0, '娱乐资讯', '/article', 6, 1430851833, 1467362921, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `jy_config`
--

DROP TABLE IF EXISTS `jy_config`;

CREATE TABLE IF NOT EXISTS `jy_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=138 ;

--
-- 转存表中的数据 `jy_config`
--

INSERT INTO `jy_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, 'JYmusic音乐管理系统，DJ音乐系统，php音乐系统', 1),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, 'JYmusic是Php+Mysql开发的一款开源的跨平台音乐管理系统,采用国内最优秀php框架thinkphp。程序完全免费，稳定，易于扩展且具有超强大负载能力，完全可以满足音乐、DJ、音乐分享、音乐资讯站等使用。', 3),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'JYmusic,JYmusic音乐管理程序,php音乐程序,原创音乐程序,音乐程序,dj舞曲程序,音乐程序，音乐管理程序，舞曲程序', 10),
(4, 'WEB_SITE_CLOSE', 4, '站点开关', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1418743475, 1, '1', 7),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 0, '', '主要用于数据解析和页面表单的生成', 1378898976, 1467495116, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号', 1378900335, 1428301591, 1, '音乐因你而精彩', 11),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:首页推荐\r\n2:频道推荐', 5),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示', 1379056370, 1450878123, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 6),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 0, 'default_color', 13),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 0, '', '配置分组', 1379228036, 1467495128, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:音乐\r\n7:上传', 12),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 0, '1:视图\r\n2:控制器', 5),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 0, 'AUTH_ON:1\r\nAUTH_TYPE:2', 7),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 3),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '120', 4),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '20', 7),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1466721970, 1, '1', 1),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\n3024-night:3024 night\nambiance:ambiance\nbase16-dark:base16 dark\nbase16-light:base16 light\nblackboard:blackboard\ncobalt:cobalt\neclipse:eclipse\nelegant:elegant\nerlang-dark:erlang-dark\nlesser-dark:lesser-dark\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 0, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 4),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：字节；建议设置20M', 1381482488, 1420738555, 1, '20971520', 6),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 8),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 9),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 0, '1', 10),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 2),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 11),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1),
(38, 'ADD_SONG_NUM', 0, '用户添加音乐次数', 3, '', '用户每天添加音乐次数', 1410508923, 1410511597, 1, '3', 7),
(39, 'MAKE_ALBUM_NUM', 0, '创建专辑次数', 3, '', '用户每天添加专辑个数', 1410511457, 1410511547, 1, '2', 10),
(40, 'USER_GROUP_RULE', 0, '前台用户组权限', 0, '', '前台用户组全部权限', 1410701238, 1467494957, 1, '', 7),
(41, 'MUSIC_UPLOAD_DRIVER', 4, '后台音乐上传驱动', 0, 'local:本地\r\nftp:FTP服务器\r\nqiniu:七牛\r\naliyun:阿里云\r\n', '设置后台上传音乐文件驱动，请配置相应驱动，本地无需配置', 1410701438, 1465640912, 1, 'local', 2),
(42, 'PICTURE_UPLOAD_DRIVER', 4, '后台图片上传驱动', 0, 'local:本地\r\nftp:FTP服务器\r\nqiniu:七牛\r\naliyun:阿里云\r\n\r\n', '后台图片文件上传驱动（不包括文本编辑器），请配置相应驱动，本地无需配置', 1410701716, 1466349400, 1, 'local', 5),
(43, 'USER_MUSICUP_DRIVER', 4, '前台上传音乐驱动', 0, 'local:本地\r\nftp:FTP服务器\r\nqiniu:七牛\r\naliyun:阿里云\r\n', '前台用户音乐上传驱动设置，请配置相应驱动，本地无需配置', 1410701765, 1465640928, 1, 'local', 3),
(44, 'MUSIC_POSITION', 3, '音乐推荐位', 5, '', '音乐推荐位，格式【数字：位置名称+回车键】  数字为递增倍数，推荐到多个位置数字值相加即可', 1410702159, 1410702298, 1, '1:网站推荐\r\n2:精品推荐\r\n4:独家发布\r\n8:火热舞曲\r\n16:开场音乐\r\n', 1),
(45, 'ALBUM_POSITION', 3, '专辑推荐位', 5, '15', '专辑推荐位，格式【数字：位置名称+回车键】  数字为递增倍数，推荐到多个位置数字值相加即可', 1410702212, 1410702312, 1, '1:首页推荐\r\n2:列表推荐\r\n', 2),
(46, 'ARTIST_POSITION', 3, '艺术家推荐位', 5, '', '艺术家推荐位，格式【数字：位置名称+回车键】  数字为递增倍数，推荐到多个位置数字值相加即可', 1410702268, 1410702268, 1, '1:首页推荐\r\n2:列表推荐', 3),
(55, 'USER_PICUP_DRIVER', 4, '前台上传图片驱动', 0, 'local:本地\r\nftp:FTP服务器\r\nqiniu:七牛\r\naliyun:阿里云\r\n', '设置用户上传图片文件驱动（不包括文本编辑器）请配置相应驱动，本地无需配置', 1413706776, 1466349414, 1, 'local', 13),
(47, 'WEB_OFF_MSG', 2, '站点关闭提示', 1, '', '关闭站点后的提示信息', 1410702742, 1410702742, 1, '系统维护，请稍后访问~~~', 8),
(48, 'JYMUSIC_UPDATE_TIME', 0, 'JYmusic更新时间', 4, '', '', 1410732630, 1451253543, 0, '20160825', 4),
(49, 'ARTICLE_BIND_CATEGORY', 0, '绑定分类', 0, '', '内容模型绑定的栏目分类，填写分类表示或分类id，用于默认显示', 1410732716, 1467152172, 1, '1', 1),
(50, 'JYMUSIC_VERSION', 1, 'JYmusic版本号', 4, '', '', 1410732822, 1451253430, 0, 'JYmusic_1.1.1', 6),
(51, 'SONGS_IMPORT_PATH', 1, '批量导入音乐路径', 5, '', '批量导入音乐数据的地址必须/结尾', 1410759851, 1417227068, 1, './Uploads/Import/', 11),
(52, 'VERIFY_OFF', 4, '前台验证码', 3, '0:关闭,1:开启', '前台验证码开关，默认关闭', 1411482781, 1416921958, 1, '0', 11),
(53, 'WEB_ROOT', 1, '网站域名', 1, '', '填写你的网站域名', 1411743978, 1411743978, 1, 'www.jyuu.cn', 2),
(56, 'WEB_PHONE', 0, '联系电话', 1, '', '', 1413986755, 1413986755, 1, '188888888888', 6),
(57, 'WEB_QQ', 0, '站长QQ', 1, '', '', 1413986787, 1417229439, 1, '378020023', 4),
(58, 'WEB_EMAIL', 1, '站长邮箱', 1, '', '', 1413986920, 1413986998, 1, '378020023@qq.com', 5),
(59, 'REG_AGREE', 2, '注册协议', 3, '', '', 1417226410, 1466722004, 1, '请仔细阅读本“使用协议” （以下亦称“本协议”）条款，如你（亦称“用户”）阅读后通过点选本协议下方的“同意”按钮而自愿接受本协议的约束，本协议就构{$webname}直接有约束力的法律文件.<br><br>1. 为使用{$webname}服务上载、传播内容，你必须已经仔细阅读并接受“使用协议”，并且已注册一个有效的、经合法授权的帐号。你对所有上载到{$webname}上的内容，无论是否由你本人或代表你所创作，负完全的法律责任。 你保证不在{$webname}上载、传播任何包含淫秽、色情、侵权、反动或其他非法内容的视频及资料。 在使用{$webname}服务的过程中，你必须始终遵守“使用协议”及其后续不时修订之版本。<br><br>2. 用户在{$webname}上传或发布原创作品及转载作品的，用户保证其对该等作品享有合法著作权/版权或者相应授权，并且用户同意授予{$webname}对所有上述作品和内容的在全球范围内的免费、不可撤销的、无限期的、并且可转让的非独家使用权许可，{$webname}有权展示、散布及推广上述作品；<br><br>3. 你不得使用{$webname}提供的服务进行任何非法、淫秽、色情及其他违反公序良俗之活动，包括但不限于非法传销、诈骗、侵权及反动活动等，{$webname}有权依据自己的独立判断在不事先通知的情况下立即删除此类活动的相关内容、停止从事此类活动的帐号使用；用户在使用{$webname}服务时必须符合中国有关法规以及其他有关国家和地区的法律规定以及国际法的有关规定。用户不得利用{$webname}服务制作、发表、复制、传送、传播、储存 违反中国有关的法律和法规的信息，不得为任何非法目的而使用网络服务系统，遵守所有与网络服务有关的网络协议、规定和程序<br><br>4. {$webname}提供的部分网络服务为收费的网络服务，用户使用收费网络服务需要向{$webname}支付一定的费用。对于收费的网络服务，{$webname}会在用户使用之前给予用户明确的提示，只有用户根据提示确认其愿意支付相关费用，用户才能使用该等收费网络服务。如用户拒绝支付相关费用，则{$webname}有权不向用户提供该等收费网络服务<br><br> 5.  {$webname}无须对任何用户的任何登记资料承担任何责任，包括但不限于鉴别、核实任何登记资料的真实性、正确性、完整性、适用性及/或是否为最新资料的责任。<br><br>6.{$webname}对于任何自{$webname}而获得的信息、内容或者广告宣传等任何资讯，不保证真实、准确和完整性。如果任何单位或者个人通过上述信息而进行任何行为，须自行甄别真伪和谨慎预防风险，否则，无论何种原因，{$webname}不对任何非与{$webname}直接发生的交易和/或行为承担任何直接、间接、附带或衍生的损失和责任!<br><br><b>特别提示：</b>你在进行注册之前，请确保你本人已经完全理解并接受本协议所有条款（尤其是免责条款），否则请不要注册。一旦你正式注册，则表明你已经完全理解并接受本协议所有条款，尤其是免责和责任限制条款。', 2),
(60, 'REG_GREET_CONTENT', 2, '欢迎信息内容', 3, '', '', 1417227323, 1466722029, 1, '您已经注册成为{$webname}的会员，请您自己遵守注册协议和法律法规。\r\n如果您有什么疑问可以联系管理员，Email:{$webmail}。\r\n', 5),
(62, 'REG_BAN_NAME', 2, '注册禁止字符', 3, '', '包括 用户名和昵称，多个英文逗号分隔', 1417229836, 1466722048, 1, 'jymusic,创始人,管理员,jycms，admin', 3),
(63, 'REG_IP_TIME', 0, '同IP时间限制', 3, '', '同一IP注册限制时间-单位小时', 1417230139, 1466722062, 1, '48', 6),
(64, 'WEB_SITE_NAME', 1, '站点名称', 1, '', '网站名称', 1418641632, 1418641718, 1, 'JYmusic音乐管理系统', 1),
(65, 'DT_SERVER_ID', 0, '默认服务器ID', 5, '', '值为0 没有服务器', 1418989996, 1418989996, 1, '0', 12),
(66, 'ADMIN_UPMUSIC_PATH', 1, '后台音乐上传路径', 0, '', '音乐文件保存路径,格式：xx/ 确保目录存在，或根目录可写权限', 1420474128, 1466349143, 1, 'Uploads/Music/', 2),
(67, 'ADMIN_UPMUSIC_MAX', 0, '后台音乐上传最大值', 0, '', '上传的文件大小限制 (0-不做限制)，单位字节，最大值取决于php.ini允许的最大值', 1420474753, 1466349620, 1, '0', 4),
(68, 'ADMIN_UPMUSIC_EXTS', 1, '后台音乐上传后缀', 0, '', '多个以英文逗号隔开', 1420475065, 1466349172, 1, 'mp3,mp4,wma,ogg', 4),
(69, 'ADMIN_UPPIC_PATH', 1, '后台图片上传目录', 0, '', '文件保存路径,格文件保存路径,格式：xx/ 确保目录存在，或根目录可写权限''', 1420725586, 1466349199, 1, 'Uploads/Picture/', 6),
(70, 'ADMIN_UPPIC_MAX', 0, '后台图片上传最大值', 0, '', '上传的文件大小限制 (0-不做限制)，单位字节，最大值取决于php.ini允许的最大值', 1420725795, 1466349633, 1, '2097152', 5),
(71, 'ADMIN_UPPIC_EXTS', 1, '后台图片上传后缀', 0, '', '多个以英文逗号隔开', 1420725985, 1466349230, 1, 'jpg,gif,png,jpeg', 8),
(74, 'USER_UPPIC_PATH', 1, '用户图片上传目录', 0, '', '文件保存路径,格式：xx/ 确保目录存在，或根目录可写权限''', 1420726987, 1466349281, 1, 'Uploads/UserPic/', 14),
(72, 'USER_UPMUSIC_PATH', 1, '用户音乐上传目录', 0, '', '文件保存路径,格式：xx/ 确保目录存在，或根目录可写权限''', 1420726474, 1466349250, 1, 'Uploads/UserUp/', 10),
(73, 'USER_UPMUSIC_MAX', 0, '用户音乐上传最大值', 7, '', '上传的文件大小限制 (0-不做限制，默认20M)，单位字节，最大值取决于php.ini允许的最大值', 1420726717, 1466349835, 1, '20971520', 6),
(75, 'USER_UPPIC_MAX', 0, '用户上传图片最大值', 7, '', '上传的文件大小限制 (0-不做限制，默认2M)，单位字节，最大值取决于php.ini允许的最大值', 1420727100, 1420727100, 1, '2097152', 7),
(76, 'SONG_COVER_SIZE', 0, '歌曲封面尺寸', 7, '', '歌曲封面处理缩略尺寸，格式（40,40），宽度-高度', 1420727432, 1420727547, 1, '40,40', 8),
(77, 'ARTIST_COVER_SIZE', 0, '艺术家封面尺寸', 7, '', '艺术家封面处理缩略尺寸，格式（40,40），宽度-高度', 1420727748, 1420727748, 1, '120,120', 9),
(78, 'GENRE_COVER_SIZE', 0, '曲风封面尺寸', 7, '', '曲风分类封面处理缩略尺寸，格式（40,40），宽度-高度', 1420727802, 1420727802, 1, '100,100', 11),
(79, 'USER_SKINS_PATH', 1, '用户背景图片路径', 3, '', '用户音乐上传小提示', 1420730858, 1450954404, 1, '/Public/skins', 12),
(137, 'AUTH_MUSICIAN_SONGS', 0, '音乐人所需歌曲', 3, '', '申请认证音乐人所需歌曲数量，为0表示不限制', 1463330130, 1467333891, 1, '2', 0),
(80, 'USER_UPMUSIC_EXTS', 1, '用户上传音乐后缀', 0, '', '允许用户上传音乐文件的后缀名称，\r\n多个以英文逗号隔开', 1420735906, 1466349262, 1, 'mp3', 12),
(81, 'ALBUM_COVER_SIZE', 0, '专辑封面尺寸', 7, '', '专辑封面处理缩略尺寸，格式（40,40），宽度-高度', 1420826555, 1420826555, 1, '200,200', 10),
(82, 'TAG_GROUP', 3, '标签分组', 5, '', '注意配置格式  1:心情   然后回车键 ', 1421597822, 1446929902, 1, '1:热门\r\n2:语言\r\n3:特色\r\n4:节日\r\n5:专题\r\n6:心情\r\n7:场景\r\n8:年代\r\n\r\n', 4),
(120, 'MAIL_TYPE', 4, '邮件类型', 128, 'SMTP模块发送\r\n其他模块发送', '', 1410491198, 1410491839, 1, '0', 1),
(121, 'MAIL_SMTP_HOST', 1, 'SMTP服务器', 128, '', '邮箱服务器名称[如：smtp.qq.com]', 1410491317, 1410937703, 1, 'smtp.exmail.qq.com', 2),
(122, 'MAIL_SMTP_PORT', 0, 'SMTP服务器端口', 128, '', '端口一般为25', 1410491384, 1410491384, 1, '465', 3),
(123, 'MAIL_SMTP_USER', 1, 'SMTP服务器用户名', 128, '', '邮箱用户名', 1410491508, 1410941682, 1, 'service@jyuu.cn', 4),
(124, 'MAIL_SMTP_PASS', 1, 'SMTP服务器密码', 128, '邮箱密码', '密码', 1410491656, 1410941695, 1, '54kefu', 5),
(125, 'MAIL_SENDER_EMAIL', 1, '邮件发送测试', 128, '', '发送测试邮件用的，测试你的邮箱配置成功没有', 1410491698, 1410937656, 1, 'zhangcb1984@163.com', 6),
(126, 'MAIL_SENDER_NAME', 1, '发件人名称', 128, '', '发件人名称', 1410925495, 1410925495, 1, 'JYmusic', 0),
(97, 'SEND_ACTIVATE_MAIL', 4, '激活邮件', 3, '0:关闭\r\n1:开启', '用户邮件验证，激活验证', 1423802500, 1466722719, 1, '0', 4),
(128, 'USER_FOLLOW_MIX', 0, '最多关注', 3, '', '最多关注用户数量', 1426606718, 1426606718, 1, '500', 13),
(132, 'WEB_SITE_STAT', 2, '统计代码', 1, '', '设置在网站底部显示的统计代码 ', 1428301744, 1428301815, 1, '', 12),
(133, 'MAIL_CONF', 1, '邮件配置', 0, '', '后台顶部快捷操作', 1428393358, 1466751749, 1, 'a:9:{s:14:"email_sendtype";s:4:"smtp";s:10:"email_host";s:18:"smtp.exmail.qq.com";s:9:"email_ssl";s:1:"1";s:10:"email_port";s:3:"";s:13:"email_account";s:15:"";s:14:"email_password";s:8:"";s:17:"email_sender_name";s:19:"JYmusic音乐程序";s:18:"email_sender_email";s:15:"";s:12:"sendto_email";s:16:"";}', 13),
(135, 'MAIL_SLL', 1, '是否启用sll连接', 128, '0', '启用sll连接', 1410925495, 1410925495, 1, '', 0),
(136, 'SAVE_FILE_RULE', 4, '生成文件名', 0, '0:自动生成\r\n1:保留原名', '设置是否自带生成文件名', 1447091026, 1467495260, 1, '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `jy_document`
--
DROP TABLE IF EXISTS `jy_document`;

CREATE TABLE IF NOT EXISTS `jy_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_document_article`
--
DROP TABLE IF EXISTS `jy_document_article`;

CREATE TABLE IF NOT EXISTS `jy_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- --------------------------------------------------------

--
-- 表的结构 `jy_file`
--

DROP TABLE IF EXISTS `jy_file`;

CREATE TABLE IF NOT EXISTS `jy_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(60) DEFAULT NULL COMMENT '保存名称',
  `savepath` char(30) DEFAULT NULL COMMENT '文件保存路径',
  `ext` char(5) DEFAULT NULL COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) DEFAULT NULL COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_genre`
--

DROP TABLE IF EXISTS `jy_genre`;

CREATE TABLE IF NOT EXISTS `jy_genre` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '歌曲分类ID',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父id',
  `cover_id` int(11) NOT NULL DEFAULT '0',
  `cover_url` varchar(255) DEFAULT NULL COMMENT '封面地址',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加分类时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COMMENT '分类描述',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_guestbook`
--

DROP TABLE IF EXISTS `jy_guestbook`;

CREATE TABLE IF NOT EXISTS `jy_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `reply_id` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `to_uid` int(10) NOT NULL DEFAULT '0' COMMENT '所属ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(40) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `content` text NOT NULL COMMENT '评论内容',
  `user_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户IP地址',
  `reply_count` smallint(4) NOT NULL DEFAULT '0' COMMENT '回复数',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_hooks`
--

DROP TABLE IF EXISTS `jy_hooks`;

CREATE TABLE IF NOT EXISTS `jy_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `jy_hooks`
--

INSERT INTO `jy_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'Links', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'SocialComment,Attachment', 1),
(5, 'pageBody', '页面内容前显示用钩子', 1, 0, 'Baidushare', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin', 1),
(9, 'upload', 'FTP 阿里OSS、七牛等上传驱动。', 1, 1467456868, 'Justup', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SyncLogin,Ads', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1),
(17, 'indexSlider', '首页幻灯片', 1, 1411063783, 'JYslider,slider,Slider', 1),
(18, 'AdminSong', '后台音乐处理', 1, 1411915095, 'Ftp,Parser', 1),
(19, 'Template', '模版管理插件钩子', 1, 1412950904, 'Template', 1),
(28, 'SyncLogin', '第三方账号同步登陆', 1, 1427183455, 'SyncLogin', 0),
(27, 'syncMeta', '第三方登陆meta接口', 1, 1403700633, 'SyncLogin', 1),
(32, 'Collect', 'JYmusic采集', 1, 1441349861, 'Collect', 1),
(33, 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', 1, 1446656013, '', 1),
(35, 'Ads', '投放广告管理插件', 1, 1452127386, 'Ads', 1),
(38, 'indexPay', '支付钩子', 1, 1467456868, 'indexPay,Pay', 1);

-- --------------------------------------------------------

--
-- 表的结构 `jy_links`
--

DROP TABLE IF EXISTS `jy_links`;

CREATE TABLE IF NOT EXISTS `jy_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '类别（1：图片，2：普通）',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '站点名称',
  `cover_id` int(10) NOT NULL COMMENT '图片ID',
  `cover_link` varchar(255) DEFAULT NULL COMMENT '图片外链地址',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='友情连接表' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_member`
--
DROP TABLE IF EXISTS `jy_member`;

CREATE TABLE IF NOT EXISTS `jy_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `pic_id` int(11) NOT NULL DEFAULT '0',
  `songs` int(10) NOT NULL DEFAULT '0' COMMENT '添加音乐数量',
  `albums` int(10) NOT NULL DEFAULT '0' COMMENT '创建专辑数量',
  `listens` int(10) NOT NULL DEFAULT '0' COMMENT '歌曲播放次数',
  `follows` int(10) NOT NULL DEFAULT '0' COMMENT '关注数量',
  `fans` int(10) DEFAULT '0' COMMENT '粉丝数量',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `hits` int(11) NOT NULL DEFAULT '1',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) DEFAULT NULL COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '金币数',
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_estonian_ci DEFAULT NULL COMMENT '个性签名',
  `location` varchar(255) DEFAULT NULL COMMENT '所在地字符串',
  `province` mediumint(6) NOT NULL DEFAULT '0' COMMENT '所在省',
  `city` int(5) NOT NULL DEFAULT '0' COMMENT '所在市',
  `district` int(5) NOT NULL DEFAULT '0' COMMENT '所在区',
  `space` tinyint(2) NOT NULL DEFAULT '0',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `cdkey` varchar(60) DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_member_auth_musician`
--

DROP TABLE IF EXISTS `jy_member_auth_musician`;

CREATE TABLE IF NOT EXISTS `jy_member_auth_musician` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) unsigned NOT NULL COMMENT '户用UID',
  `group_id` int(11) NOT NULL COMMENT '认证类型，即所申请的认证组的ID',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(50) NOT NULL COMMENT '证件号码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '证认信息',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '认证状态，0：否；1：是',
  `attach_id` varchar(255) NOT NULL COMMENT '认证资料，存储用户上传的ID',
  `reason` varchar(255) DEFAULT NULL COMMENT '证认理由',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_member_group`
--
DROP TABLE IF EXISTS `jy_member_group`;

CREATE TABLE IF NOT EXISTS `jy_member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '用户组名称',
  `icon` varchar(120) NOT NULL COMMENT '用户组图标名称',
  `app_name` varchar(20) NOT NULL DEFAULT 'public' COMMENT '应用名称',
  `is_auth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为认证组',
  `rules` text,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `jy_member_group`
--

INSERT INTO `jy_member_group` (`id`, `name`, `icon`, `app_name`, `is_auth`, `rules`, `create_time`) VALUES
(1, '普通会员', '', 'public', 0, '', NULL),
(2, 'VIP会员', 'vip', 'public', 0, '{"is_pay":"1","pay_mcoin":"10","pay_hycoin":"55","pay_ycoin":"100"}', NULL),
(3, '认证音乐人', 'artist', 'public', 1, '{"is_pay":"","pay_mcoin":"","pay_hycoin":"","pay_ycoin":""}', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `jy_member_group_link`
--

DROP TABLE IF EXISTS `jy_member_group_link`;

CREATE TABLE IF NOT EXISTS `jy_member_group_link` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(10) NOT NULL COMMENT '户用UID',
  `group_id` int(10) NOT NULL COMMENT '户用组ID',
  `end_time` int(11) NOT NULL COMMENT '所在组到期时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_menu`
--
DROP TABLE IF EXISTS `jy_menu`;

CREATE TABLE IF NOT EXISTS `jy_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `style` text NOT NULL COMMENT 'class样式',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=199 ;

--
-- 转存表中的数据 `jy_menu`
--

INSERT INTO `jy_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `style`, `status`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 'dashboard', 1),
(2, '内容', 0, 3, 'Article/index', 0, '', '', 0, 'archive', 1),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0, '', 1),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0, '', 1),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0, '', 1),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0, '', 1),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0, '', 1),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0, '', 1),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0, '', 1),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0, '', 1),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0, '', 1),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0, '', 1),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0, '', 1),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0, '', 1),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0, '', 1),
(16, '用户', 0, 4, 'User/index', 0, '', '', 0, 'user', 1),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0, '', 1),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0, '', 1),
(19, '用户行为', 16, 0, 'User/action', 1, '', '行为管理', 0, '', 1),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0, '', 1),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0, '', 1),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0, '', 1),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0, '', 1),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0, '', 1),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0, '', 1),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0, '', 1),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '后台权限', 0, '', 1),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0, '', 1),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0, '', 1),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0, '', 1),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0, '', 1),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0, '', 1),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0, '', 1),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0, '', 1),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0, '', 1),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0, '', 1),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0, '', 1),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0, '', 1),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0, '', 1),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0, '', 1),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0, '', 1),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0, '', 1),
(43, '扩展', 0, 7, 'Addons/index', 0, '', '', 0, 'puzzle-piece', 1),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0, '', 1),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, '', 1),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, '', 1),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, '', 1),
(48, '快速生成插件', 44, 0, 'Addons/build', 1, '开始生成插件结构', '', 0, '', 1),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0, '', 1),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0, '', 1),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0, '', 1),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0, '', 1),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, '', 1),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, '', 1),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0, '', 1),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, '', 1),
(57, '钩子管理', 43, 2, 'Addons/hooks', 1, '', '扩展', 0, '', 1),
(58, '模型管理', 68, 3, 'Model/index', 1, '', '系统设置', 0, '', 1),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0, '', 1),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0, '', 1),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0, '', 1),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0, '', 1),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0, '', 1),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0, '', 1),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0, '', 1),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0, '', 1),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0, '', 1),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0, 'wrench', 1),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0, '', 1),
(70, '配置管理', 68, 4, 'Config/index', 1, '', '系统设置', 0, '', 1),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, '', 1),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0, '', 1),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0, '', 1),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0, '', 1),
(75, '菜单管理', 68, 5, 'Menu/index', 1, '', '系统设置', 0, '', 1),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0, '', 1),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0, '', 1),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0, '', 1),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0, '', 1),
(80, '分类管理', 2, 2, 'Category/index', 0, '', '内容', 0, '', 1),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '内容', 0, '', 1),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0, '', 1),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0, '', 1),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0, '', 1),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0, '', 1),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0, '', 1),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0, '', 1),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0, '', 1),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0, '', 1),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0, '', 1),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0, '', 1),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0, '', 1),
(93, '其他', 0, 5, 'other', 1, '', '', 0, 'collapse', 1),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0, '', 1),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0, '', 1),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0, '', 1),
(108, '修改管理密码', 17, 0, 'User/updatePassword', 0, '', '', 0, '', 1),
(109, '修改管理昵称', 17, 0, 'User/updateNickname', 0, '', '', 0, '', 1),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0, '', 1),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0, '', 1),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0, '', 1),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0, '', 1),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0, '', 1),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0, '', 1),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 1, '', 1),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0, '', 1),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0, '', 1),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0, '', 1),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0, '', 1),
(122, '数据列表', 58, 0, 'think/lists', 1, '', '', 0, '', 1),
(123, '音乐', 0, 2, 'Songs/index', 0, '', '', 0, 'music', 1),
(124, '歌曲管理', 123, 0, 'Songs/index', 0, '', '音乐管理', 0, '', 1),
(125, '添加', 124, 0, 'Songs/add', 0, '添加歌曲', '音乐管理', 0, '1', 1),
(126, '修改', 124, 1, 'Songs/mod', 1, '修改歌曲', '音乐管理', 0, '', 1),
(127, '删除', 124, 2, 'Songs/del', 1, '删除歌曲', '音乐管理', 0, '', 1),
(128, '清空', 158, 4, 'Recycle/clear', 0, '清空回收站歌曲', '辅助功能', 0, '', 1),
(129, '专辑管理', 123, 1, 'Album/index', 0, '专辑控制', '音乐管理', 0, 'th-large', 1),
(130, '添加', 129, 0, 'Album/add', 1, '添加新专辑', '音乐管理', 0, '', 1),
(131, '修改', 129, 2, 'Album/mod', 1, '修改专辑', '音乐管理', 0, '', 1),
(132, '删除', 129, 3, 'Album/del', 1, '删除将无法恢复', '音乐管理', 0, '', 1),
(133, '艺术家管理', 123, 3, 'Artist/index', 0, '歌手管理页面', '音乐管理', 0, 'microphone', 1),
(134, '添加', 133, 0, 'Artist/add', 0, '添加新歌手', '音乐管理', 0, '', 1),
(135, '修改', 133, 1, 'Artist/mod', 0, '修改歌手', '音乐管理', 0, '', 1),
(136, '删除', 133, 2, 'Artist/del', 0, '删除将无法恢复', '音乐管理', 0, '', 1),
(137, '曲风管理', 123, 2, 'Genre/index', 0, '设置音乐分类', '音乐管理', 0, 'tags', 1),
(138, '添加', 137, 0, 'Genre/add', 1, '添加新曲风', '音乐管理', 0, '', 1),
(139, '修改', 137, 1, 'Genre/mod', 1, '修改曲风', '音乐管理', 0, '', 1),
(140, '删除', 137, 2, 'Genre/del', 1, '删除将无法恢复', '音乐管理', 0, '', 1),
(141, '专辑类型', 123, 5, 'AlbumType/index', 0, '专辑类型管理页面', '音乐管理', 0, '', 1),
(142, '添加', 141, 1, 'AlbumType/add', 1, '添加专辑类型', '音乐管理', 0, '', 1),
(143, '修改', 141, 2, 'AlbumType/mod', 1, '修改专辑类型', '音乐管理', 0, '', 1),
(144, '删除', 141, 3, 'AlbumType/del', 1, '删除将无法恢复', '音乐管理', 0, '', 1),
(145, '艺术家类型', 123, 6, 'ArtistType/index', 0, '歌手类型管理页面', '音乐管理', 0, '', 1),
(146, '添加', 145, 1, 'ArtistType/add', 0, '添加歌手类型', '音乐管理', 0, '', 1),
(147, '修改', 145, 2, 'ArtistType/mod', 0, '修改歌手类型', '音乐管理', 0, '', 1),
(148, '删除', 145, 3, 'ArtistType/del', 0, '删除将无法恢复', '音乐管理', 0, '', 1),
(149, '缓存静态', 69, 0, 'Config/cache', 1, '', '网站设置', 0, '', 1),
(150, '批量导入', 123, 10, 'Songs/bulkImport', 0, '批量导入歌曲', '辅助功能', 0, '', 1),
(151, '审核歌曲', 124, 5, 'songs/audit', 0, '审核歌曲', '音乐管理', 0, '', 1),
(152, '信息管理', 16, 0, 'Message/index', 0, '', '用户管理', 0, '', 1),
(153, '添加信息', 152, 0, 'Message/add', 1, '', '用户管理', 0, '', 1),
(154, '服务器管理', 123, 8, 'Server/index', 0, '', '辅助功能', 0, '', 1),
(155, '添加服务器', 154, 0, 'Server/add', 1, '', '音乐管理', 0, '', 1),
(156, '修改服务器', 154, 0, 'Server/mod', 1, '', '音乐管理', 0, '', 1),
(157, '音乐审核', 123, 9, 'Audit/index', 0, '', '辅助功能', 0, '', 1),
(158, '回收站', 123, 11, 'Recycle/index', 0, '', '辅助功能', 0, '', 1),
(159, '标签管理', 123, 7, 'Tag/index', 0, '', '音乐管理', 0, '', 1),
(160, '新增标签', 159, 0, 'Tag/add', 1, '', '音乐管理', 0, '', 1),
(161, '修改标签', 159, 0, 'Tag/mod', 1, '', '音乐管理', 0, '', 1),
(162, '删除标签', 159, 0, 'Tag/del', 0, '', '音乐管理', 0, '', 1),
(163, '上传驱动', 70, 0, 'Config/updrive', 0, '上传驱动配置', '系统设置', 0, '', 1),
(164, '视图配置', 70, 0, 'Config/view', 1, '', '系统设置', 0, '', 1),
(166, '新增资料组', 165, 0, 'Profile/addgroup', 0, '', '用户管理', 0, '', 1),
(167, '修改资料组', 165, 0, 'Profile/modgroup', 0, '', '用户管理', 0, '', 1),
(168, '字段管理', 165, 0, 'Profile/memberfield', 0, '', '用户管理', 0, '', 1),
(169, '添加字段', 165, 0, 'Profile/addfield', 0, '', '用户管理', 0, '', 1),
(170, '修改字段', 165, 0, 'Profile/modfield', 0, '', '用户管理', 0, '', 1),
(171, '删除字段', 165, 0, 'Profile/delfield', 0, '', '用户管理', 0, '', 1),
(172, '邮件配置', 68, 7, 'Email/index', 0, '', '系统设置', 0, '', 1),
(173, 'SEO管理', 68, 6, 'Seo/index', 0, '', '系统设置', 0, '', 1),
(174, '新增SEO规则', 173, 0, 'Seo/add', 0, '', '系统设置', 0, '', 1),
(175, '修改Seo规则', 173, 0, 'Seo/mod', 0, '', '系统设置', 0, '', 1),
(176, '删除SEO规则', 173, 0, 'Seo/del', 0, '', '系统设置', 0, '', 1),
(186, '快速新增', 124, 0, 'Songs/addall', 0, '批量添加歌曲', '音乐管理', 0, '', 1),
(185, '修改管理用户名', 17, 0, 'User/updateUsername', 0, '', '', 0, '', 1),
(189, '用户组管理', 16, 0, 'UserGroup/index', 0, '', '用户管理', 0, '', 1),
(190, '添加用户组', 189, 0, 'UserGroup/add', 0, '', '', 0, '', 1),
(191, '修改用户组', 189, 0, 'UserGroup/mod', 1, '', '', 0, '', 1),
(192, '编辑用户', 17, 0, 'User/edit', 1, '', '用户管理', 0, '', 1),
(193, '认证管理', 16, 0, 'auth/index', 0, '', '用户管理', 0, '', 1),
(194, '添加认证', 193, 0, 'Auth/add', 1, '', '', 0, '', 1),
(195, '修改认证', 193, 0, 'Auth/mod', 1, '', '', 0, '', 1),
(196, '删除认证', 193, 0, 'Auth/del', 1, '', '', 0, '', 1),
(197, '获取标签', 159, 0, 'Tag/showTag', 1, '', '', 0, '', 1),
(198, '查找数据', 124, 0, 'Ajax/findData', 1, '', '', 0, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `jy_message`
--

DROP TABLE IF EXISTS `jy_message`;

CREATE TABLE IF NOT EXISTS `jy_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `content` text NOT NULL COMMENT '信息内容',
  `post_uid` int(11) NOT NULL COMMENT '提交用户id',
  `post_uname` char(40) NOT NULL,
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '接收用户id',
  `to_uname` char(40) NOT NULL,
  `reply_id` int(11) NOT NULL COMMENT '回复ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `is_tip` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否提示过',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否读取',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_model`
--
DROP TABLE IF EXISTS `jy_model`;

CREATE TABLE IF NOT EXISTS `jy_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `jy_model`
--

INSERT INTO `jy_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","12","10","5","24","16"],"2":["9","13","2","19","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', '', 0, '', '', 1383891243, 1387260622, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `jy_music_tag`
--

DROP TABLE IF EXISTS `jy_music_tag`;

CREATE TABLE IF NOT EXISTS `jy_music_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL DEFAULT '1' COMMENT '所属音乐类型，1：歌曲, 2: 歌手,3:专辑',
  `music_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_notice`
--

DROP TABLE IF EXISTS `jy_notice`;

CREATE TABLE IF NOT EXISTS `jy_notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `to_uid` int(11) NOT NULL COMMENT 'UID',
  `appname` varchar(50) NOT NULL DEFAULT 'public',
  `title` varchar(250) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `is_read` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `tip_group` int(11) NOT NULL DEFAULT '0' COMMENT '提示用户组类型 表示所有',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `uid_read` (`to_uid`,`is_read`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_picture`
--

DROP TABLE IF EXISTS `jy_picture`;

CREATE TABLE IF NOT EXISTS `jy_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '所属id',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '所属类型1:音乐，2：专辑，3：歌手，4：曲风，5：会员',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_region`
--
DROP TABLE IF EXISTS `jy_region`;

CREATE TABLE IF NOT EXISTS `jy_region` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `jy_region`
--

INSERT INTO `jy_region` (`id`, `name`, `add_time`, `update_time`) VALUES
(1, '内地', 1383844498, 1383844498),
(2, '港台', 1383844498, 1383844498),
(3, '日韩', 1383844498, 1383844498),
(4, '欧美', 1383844498, 1383844498),
(5, '其它', 1383844498, 1383844498);

-- --------------------------------------------------------

--
-- 表的结构 `jy_seo_rule`
--
DROP TABLE IF EXISTS `jy_seo_rule`;

CREATE TABLE IF NOT EXISTS `jy_seo_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `app` varchar(40) NOT NULL,
  `controller` varchar(40) NOT NULL,
  `action` varchar(40) NOT NULL,
  `keywords_rule` text NOT NULL,
  `description_rule` text NOT NULL,
  `title_rule` text NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `jy_seo_rule`
--

INSERT INTO `jy_seo_rule` (`id`, `title`, `app`, `controller`, `action`, `keywords_rule`, `description_rule`, `title_rule`, `sort`, `status`) VALUES
(12, '音乐单曲页面', 'Home', 'Music', 'detail', '{$name} - 在线试听-在线免费下载-高音质下载-{$webtitle} ', '{$name} - 在线试听-在线免费下载-高音质下载-{$webtitle} ', '{$name} - 在线试听-{$webtitle} ', 0, 1),
(13, '艺术家页面', 'Home', 'Artist', 'index', '{$name}全部歌手 - {$webtitle}', '全部歌手 - {$webtitle}', '{$name}全部歌手 - {$webtitle}', 0, 1),
(14, '艺术家详细页面', 'Home', 'Artist', 'detail', '{$name}-【{$name}歌曲大全】_{$name}最新歌曲_{$name}最好听的歌', '{$name}-【{$name}歌曲大全】_{$name}最新歌曲_{$name}最好听的歌', '{$name}-【{$name}歌曲大全】_{$name}最新歌曲_{$name}最好听的歌', 0, 1),
(15, '专辑页面', 'Home', 'Album', 'index', '2015年 发行专辑列表-{$webtitle}', '2015年 发行专辑列表-{$webtitle}', '2015年 发行专辑列表-{$webtitle}', 0, 1),
(16, '专辑详情页面', 'Home', 'Album', 'detail', '{$name}专辑,{$name}下载', '{$name}专辑,{$name}下载- {$webname}', '{$name}-{$webtitle}', 0, 1),
(17, '曲风分类页面', 'Home', 'Genre', 'index', '风格分类-{$webtitle}', '风格分类-{$webtitle}', '风格分类-{$webtitle}', 0, 1),
(18, '曲风详细页面', 'Home', 'Genre', 'detail', '{$name}-{$webtitle}', '{$name}-{$webtitle}', '{$name}-{$webtitle}', 0, 1),
(19, '标签页面', 'Home', 'Tag', 'index', '音乐标签-{$webtitle}', '音乐标签-{$webtitle}', '音乐标签-{$webtitle}', 0, 1),
(20, '标签详情页', 'Home', 'Tag', 'detail', '{$name} 音乐标签- {$webtitle}', '{$name} 音乐标签- {$webtitle}', '{$name} 音乐标签- {$webtitle}', 0, 1),
(21, '搜索页面', 'Home', 'Search', 'index', '{$webname}音乐搜索引擎', '{$webname}音乐搜索引擎', '{$webname}音乐搜索引擎', 0, 1),
(22, '下载页面', 'Home', 'Down', 'index', '{$name}mp3免费下载', '{$name}mp3免费下载', '{$name}mp3免费下载', 0, 1),
(23, '用户个人页', 'User', 'Home', 'index', '{$username}的音乐空间', '{$username}的音乐空间', '{$username}的音乐空间', 0, 1),
(24, '排行榜', 'Home', 'Ranks', 'index', '音乐排行 - {$webtitle}', '音乐排行 - {$webtitle}', '音乐排行 - {$webtitle}', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jy_server`
--

DROP TABLE IF EXISTS `jy_server`;

CREATE TABLE IF NOT EXISTS `jy_server` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `listen_url` varchar(255) NOT NULL,
  `down_url` varchar(255) NOT NULL,
  `create_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '服务器状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_site`
--

DROP TABLE IF EXISTS `jy_site`;

CREATE TABLE IF NOT EXISTS `jy_site` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `name` char(16) DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `appname` varchar(40) NOT NULL DEFAULT 'about',
  `content` text NOT NULL COMMENT '文档内容',
  `template` varchar(100) DEFAULT '' COMMENT '详情页显示模板',
  `update_time` int(11) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型下载表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `jy_site`
--

INSERT INTO `jy_site` (`id`, `name`, `pid`, `title`, `appname`, `content`, `template`, `update_time`, `create_time`, `status`) VALUES
(1, 'about', 0, '关于JYmusic', 'about', 'JYmusic是Php+Mysql开发的一款开源的跨平台音乐管理系统,采用国内最优秀php框架thinkphp。程序完全免费，稳定，易于扩展且具有超强大负载能力，完全可以满足音乐、DJ、音乐分享、音乐资讯站等使用。', '', 0, 1466929310, 1),
(2, 'copy', 0, '版权声明', 'about', '<p>\r\n	<b>版权声明：</b>\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JYmusic是一款 开源免费的音乐程序，我们致力解决广大音乐人，dj作者分享音乐，推广音乐的问题，免费不代表放纵\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; &nbsp; 在没有我们许可的情况下你无权去除网页，以及源码内部版权信息，否者我将追击其法律责任\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 我们不希望你能回报我们。但是应该得到最起码的尊重，所以版权部分必须保留。\r\n</p>\r\n<br />\r\n<p>\r\n	<b>联系方式:</b>\r\n</p>\r\n<p>\r\n	联系<b>QQ:378020023</b>\r\n</p>', '', 0, 1467107173, 1),
(3, 'contact', 0, '联系我们', 'about', '<p>\r\n	<b>歌曲收录</b><br />\r\n唱片公司或网络歌手发布最新歌曲，联系<b>QQ: 378020023</b>\r\n</p>\r\n<br />\r\n<p>\r\n	<b>歌曲推广</b><br />\r\n歌曲、专辑首页图片或榜单推荐，联系<b>QQ: <b>378020023</b></b>\r\n</p>\r\n<br />\r\n<p>\r\n	<b>友情连接</b><br />\r\n网站友情连接交换，联系<b>QQ: 37802023</b>\r\n</p>\r\n<br />\r\n<b>商务合作</b><br />\r\n品牌广告投放、版权合作，联系<b>QQ: <b>378020023</b></b>', '', 0, 1467107359, 1),
(4, 'link', 0, '友情连接', 'about', '<p>\r\n	<b>友情连接要求：</b> \r\n</p>\r\n<p>\r\n	1、LOGO大小：90*30\r\n</p>\r\n<p>\r\n	2、违反我国现行法律的或含有令人不愉快内容的网站勿扰；\r\n</p>\r\n<p>\r\n	3、网站Alexa排名不低于10000名；\r\n</p>\r\n<p>\r\n	4、网站Google pagerank不少于3；\r\n</p>\r\n<p>\r\n	5、友情链接网站之间有义务向对方报告链接失效，文字、图片更新等问题，在解除友情链接之前亦应该通知对方；\r\n</p>\r\n<br />\r\n<p>\r\n	<b>友情连接联系QQ:378020023</b> \r\n</p>', '', 0, 1467107430, 1),
(5, 'reg', 0, '如何注册', 'help', '点击上方注册按钮', '', 0, 1467110133, 1),
(6, 'questions', 0, '常见问题', 'help', '常见问题', '', 0, 1467113553, 1),
(7, 'feedback', 0, '反馈建议', 'help', '反馈建议', '', 0, 1467113865, 1),
(8, 'ver', 0, '认证音乐人', 'help', '认证音乐人', '', 0, 1467114053, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jy_slider`
--

DROP TABLE IF EXISTS `jy_slider`;

CREATE TABLE IF NOT EXISTS `jy_slider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `cover_id` int(10) NOT NULL COMMENT '图片ID',
  `img_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片外链',
  `link_title` varchar(80) NOT NULL DEFAULT '' COMMENT '链接标题',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='幻灯片表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `jy_slider`
--

INSERT INTO `jy_slider` (`id`, `title`, `description`, `cover_id`, `img_url`, `link_title`, `link`, `level`, `status`, `create_time`) VALUES
(1, '星势力榜“最具影响力歌曲', '也许你与星势力榜首期活动擦肩而过，也许你频频打榜失败，也许，你只是差一个方法！', 0, 'http://service.ixingtu.com/ixtres/news/20160516/185745717476.jpg', '', 'http://jyuu.cn', 0, 1, 1465493188),
(2, 'Alan Walker携新作强势归来', 'Alan Walker发行了抖腿舞曲风格新作', 0, 'http://p3.music.126.net/QpXyha6XTURpWML3p0UyBg==/3413983610342275.jpg', '', 'http://jyuu.cn', 0, 1, 1465493313);

-- --------------------------------------------------------

--
-- 表的结构 `jy_songs`
--

DROP TABLE IF EXISTS `jy_songs`;

CREATE TABLE IF NOT EXISTS `jy_songs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '歌曲ID',
  `name` varchar(255) NOT NULL COMMENT '歌曲名字',
  `genre_id` smallint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类ID',
  `genre_name` varchar(255) DEFAULT NULL,
  `album_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属专辑ID',
  `album_name` varchar(255) DEFAULT NULL COMMENT '所属专辑',
  `order_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '专辑里的顺序',
  `artist_id` int(10) NOT NULL DEFAULT '0' COMMENT '所属歌手ID',
  `artist_name` varchar(255) NOT NULL DEFAULT '网络' COMMENT '所属歌手',
  `tags` varchar(255) DEFAULT NULL COMMENT '所属标签',
  `cover_id` int(11) NOT NULL DEFAULT '0',
  `cover_url` varchar(255) DEFAULT NULL COMMENT '封面地址',
  `up_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传者ID',
  `up_uname` varchar(255) DEFAULT NULL COMMENT '上传者名字',
  `digg` int(11) NOT NULL DEFAULT '0' COMMENT '顶',
  `bury` int(11) NOT NULL DEFAULT '0' COMMENT '踩',
  `server_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '所属服务器',
  `mix` varchar(255) DEFAULT NULL COMMENT '混编',
  `download` int(10) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `rater` tinyint(2) NOT NULL DEFAULT '0' COMMENT '评分',
  `listens` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `recommend` int(11) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `sing` char(40) DEFAULT NULL COMMENT '原唱',
  `position` smallint(6) NOT NULL DEFAULT '0' COMMENT '推荐位',
  `favtimes` int(11) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `likes` int(11) NOT NULL DEFAULT '0' COMMENT '喜欢',
  `score` int(10) unsigned DEFAULT '0' COMMENT '下载积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载金币',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT '评论次数',
  `lyrics` varchar(255) DEFAULT NULL COMMENT '作词',
  `composer` varchar(255) DEFAULT NULL COMMENT '作曲',
  `midi` varchar(255) DEFAULT NULL COMMENT '编曲',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`digg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_songs_extend`
--

DROP TABLE IF EXISTS `jy_songs_extend`;

CREATE TABLE IF NOT EXISTS `jy_songs_extend` (
  `mid` int(11) NOT NULL COMMENT 'id',
  `listen_url` varchar(255) NOT NULL COMMENT '试听地址',
  `down_url` varchar(255) NOT NULL COMMENT '下载地址',
  `listen_file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '试听所属文件id',
  `down_file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载所属文件id',
  `file_size` char(16) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `play_time` varchar(10) DEFAULT NULL COMMENT '播放时长',
  `bitrate` char(16) NOT NULL DEFAULT '0' COMMENT '比特率',
  `disk_url` varchar(255) DEFAULT NULL COMMENT '网盘下载吗',
  `disk_pass` char(16) DEFAULT NULL COMMENT '网盘密码',
  `down_rule` varchar(500) DEFAULT NULL,
  `lrc` text COMMENT '歌词',
  `introduce` text COMMENT '灵感',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jy_sync_login`
--

DROP TABLE IF EXISTS `jy_sync_login`;

CREATE TABLE IF NOT EXISTS `jy_sync_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `openid` varchar(150) NOT NULL,
  `type` char(40) NOT NULL,
  `access_token` varchar(150) NOT NULL,
  `refresh_token` varchar(150) NOT NULL,
  `is_sync` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否同步',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_tag`
--


DROP TABLE IF EXISTS `jy_tag`;

CREATE TABLE IF NOT EXISTS `jy_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(255) NOT NULL COMMENT '标签名称',
  `alias` varchar(255) DEFAULT NULL COMMENT '别名',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '标签歌曲数量',
  `group` tinyint(4) NOT NULL DEFAULT '0' COMMENT '所属标签组',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_ucenter_admin`
--

DROP TABLE IF EXISTS `jy_ucenter_admin`;

CREATE TABLE IF NOT EXISTS `jy_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_ucenter_app`
--

DROP TABLE IF EXISTS `jy_ucenter_app`;

CREATE TABLE IF NOT EXISTS `jy_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_ucenter_member`
--
DROP TABLE IF EXISTS `jy_ucenter_member`;

CREATE TABLE IF NOT EXISTS `jy_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_ucenter_setting`
--

DROP TABLE IF EXISTS `jy_ucenter_setting`;

CREATE TABLE IF NOT EXISTS `jy_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_user_down`
--
DROP TABLE IF EXISTS `jy_user_down`;

CREATE TABLE IF NOT EXISTS `jy_user_down` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `music_id` int(11) NOT NULL,
  `user_ip` bigint(20) NOT NULL,
  `count` int(10) NOT NULL DEFAULT '1' COMMENT '下载次数',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_user_fav`
--

CREATE TABLE IF NOT EXISTS `jy_user_fav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL DEFAULT '1',
  `uid` int(11) NOT NULL,
  `music_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_user_follow`
--

CREATE TABLE IF NOT EXISTS `jy_user_follow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '粉丝表ID',
  `uid` int(11) unsigned NOT NULL COMMENT '被关注者',
  `follow_uid` int(11) NOT NULL COMMENT '被关注者昵称',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_user_like`
--

CREATE TABLE IF NOT EXISTS `jy_user_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL DEFAULT '1',
  `uid` int(11) NOT NULL,
  `music_id` int(11) NOT NULL,
  `count` int(10) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_user_listen`
--

CREATE TABLE IF NOT EXISTS `jy_user_listen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `music_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_user_pay_history`
--

DROP TABLE IF EXISTS `jy_user_pay_history`;

CREATE TABLE IF NOT EXISTS `jy_user_pay_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '支付会员',
  `out_trade_no` char(40) NOT NULL COMMENT '用户订单号',
  `price` decimal(5,2) unsigned NOT NULL COMMENT '提交金额',
  `body` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `total_fee` decimal(5,2) unsigned DEFAULT NULL COMMENT '交易金额',
  `trade_no` char(40) DEFAULT NULL COMMENT '支付宝交易号',
  `user_ip` bigint(20) NOT NULL COMMENT '支付者ip',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态 0：失败，1：成功',
  `create_time` int(11) NOT NULL COMMENT '交易创建时间',
  PRIMARY KEY (`id`),
  KEY `out_trade_no` (`out_trade_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_user_recommend`
--

CREATE TABLE IF NOT EXISTS `jy_user_recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `type` tinyint(2) NOT NULL DEFAULT '1',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `music_id` int(10) NOT NULL DEFAULT '0' COMMENT '音乐id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户创建专辑' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_user_space`
--

CREATE TABLE IF NOT EXISTS `jy_user_space` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `skin` varchar(50) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `lock` int(11) NOT NULL DEFAULT '0',
  `banner` text,
  `bg` text,
  `channel` varchar(200) NOT NULL DEFAULT 'index',
  `indexunit` varchar(200) NOT NULL COMMENT '首页部件',
  `sidebarunit` varchar(200) NOT NULL COMMENT '侧边栏部件',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户空间' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jy_user_upload`
--

CREATE TABLE IF NOT EXISTS `jy_user_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `music_id` int(11) NOT NULL DEFAULT '0',
  `file_id` int(11) NOT NULL DEFAULT '0',
  `user_ip` bigint(20) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


