<?php
if(!defined('APP_NAME')) exit('Access Denied');

return array(
	"field"=>array(
		"name"=>array(
			"name"=>"姓名",
			"required"=>true
		),
		"sex"=>array(
			"name"=>"性别"
		),
        "education "=>array(
            "name"=>"学历"
        ),
		"idcard"=>array(
			"name"=>"身份证",
            "required"=>true
		),
		"area"=>array(
			"name"=>"地区",
            "required"=>true
		),
		"email"=>array(
			"name"=>"邮箱"
		),
        "address"=>array(
            "name"=>"通讯地址"
        ),
        "company"=>array(
            "name"=>"工作单位"
        ),

		"phone"=>array(
			"name"=>"电话",
            "required"=>true
		),
        "tel"=>array(
            "name"=>"固定电话",
            "required"=>true
        ),
		"job_type"=>array(
			"name"=>"工作类型"
		),
		"working_life"=>array(
            "name"=>"工作年限"
        ),
        "content"=>array(
            "name"=>"内容"
        ),


	),
	"list"=>array(
		"name",
		"email",
		"phone",
		"address"
	)
);