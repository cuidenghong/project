<?php
return array(
	'APP_STATUS'               => 'debug',
	'APP_GROUP_LIST'           => 'Admin,Home,Common',
	'APP_AUTOLOAD_PATH'        => '@.TagLib',

	//默认分组
	'DEFAULT_GROUP'            => 'Home',

	//URL设置
	'URL_MODEL'                => 3,

	//数据库配置
	'DB_TYPE'                  => 'mysql',
	'DB_HOST'                  => '192.168.3.80',
	'DB_PORT'                  => 3306,
	'DB_NAME'                  => 'project',
	'DB_USER'                  => 'root',
	'DB_PWD'                   => 'dodoca',
	'DB_PREFIX'                => 'tp_',
	'DB_SQL_LOG'               => false,

	//session配置
	'SESSION_AUTO_START'       => false,
	'SESSION_OPTIONS'          => array(
		'expire'               => 43200,
		'name'                 => 'LCMFSESSID'
	),

	//模版 配置
	'LAYOUT_ON'                => false,
	'LAYOUT_NAME'              => '../layout',
	'TAG_NESTED_LEVEL'         => 9,
	'TMPL_STRIP_SPACE'         => false,
	'TMPL_PARSE_STRING'        => array(
		'__STATIC__'           => __ROOT__.'/static',
		'__PAGE__TITLE__'      => '信息管理系统'
	),
	
	//标签配置
	'TAGLIB_PRE_LOAD'          => 'column,data,tool',
	
	//参数过滤函数
	'VAR_FILTERS'              => 'requestFilterHandler',
	'DEFAULT_FILTER'           => '',
	
	//扩展配置
	'LOAD_EXT_CONFIG'          => MODULE_NAME.'/config,rbac,upload',
	
	//动态载入
	'LOAD_EXT_FILE'            => 'functions',

    //微信key
    'APPID' => '',
    'SECRET' => '',
);