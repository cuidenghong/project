<?php
if(!defined('APP_NAME')) exit('Access Denied');

return array(
	"field"=>array(
		"keywords"=>array(
			"name"=>"关键字",
			"required"=>true
		),
		"reply_msg"=>array(
			"name"=>"回复内容",
            "required"=>true
		),

	),
	"list"=>array(
		"keywords",
		"reply_msg",
	)
);