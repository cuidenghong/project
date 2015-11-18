<?php
if(!defined('APP_NAME')) exit('Access Denied');

return array(
	"field"=>array(
		"name"=>array(
			"name"=>"产品名称",
			"required"=>true
		),
		"model"=>array(
			"name"=>"产品型号",
            "required"=>true
		),
        "number "=>array(
            "name"=>"订购数量"
        ),
		"username"=>array(
			"name"=>"联系人",
            "required"=>true
		),
		"phone"=>array(
			"name"=>"联系电话",
            "required"=>true
		),
        "qq"=>array(
            "name"=>"QQ"
        ),
		"email"=>array(
			"name"=>"邮箱"
		),

        "address"=>array(
            "name"=>"收货地址"
        ),
        "content"=>array(
            "name"=>"内容"
        ),


	),
	"list"=>array(
		"name",
		"model",
		"number",
		"username",
        "phone",
	)
);