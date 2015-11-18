<?php
if(!defined('APP_NAME')) exit('Access Denied');

class MessageAction extends BaseAction {
	public function index(){
		$this->display();
	}
	
	public function insert(){
		$Message = D("Message");
		$data = $this->_post();
		try{
			$Message->insert($data);
			$this->success("申请加盟成功");
		}catch(Exception $ex){
			$this->error($ex->getMessage());
		}
	}
}