<?php
if(!defined('APP_NAME')) exit('Access Denied');

class OrderAction extends BaseAction {
	public function index(){
		$Order = D("Order");
		$keyword = $this->_get("keyword");
		if(!empty($keyword)){
			$field = "name|model|number|username|phone|clientip|content";
			$options["query"][$field] = array("like", sprintf("%%%s%%", $keyword));
		}
        $list = $Order->getPageList($options);
		$this->assign($list);
		$this->display();
	}

    public function delete($messageid){
        $Order = D("Order");
        if($Order->where(array("messageid"=>array("in", $messageid)))->delete() === false){
            $this->error("删除留言失败");
        }else{
            $this->success("删除留言成功", null, array(
                "navTabId"=>"Message"
            ));
        }
    }

    public function view($messageid){
        $Order = D("Order");
        $data = $Order->getInfo($messageid);
        $this->assign("data", $data);
        $this->display();
    }
}