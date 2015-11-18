<?php
if(!defined('APP_NAME')) exit('Access Denied');

class OrderAction extends BaseAction {
	public function index(){
		$this->display();
	}
	
	public function insert(){
		$Order = D("Order");

		$data = $this->_post();
		try{
            $Order->insert($data);
			$this->success("订购成功");
		}catch(Exception $ex){
			$this->error($ex->getMessage());
		}
	}
}