<?php
/**
 * @filename FootmenuAction.php
 * @author Cui.D.H <360612637@qq.com>
 * @datetime 2015/11/18 16:57
 * @description 微信底部菜单
 */

if(!defined('APP_NAME')) exit('Access Denied');

class FootmenuAction extends BaseAction
{

	public function index()
    {
		$Footmenu = D("Footmenu");
		$keyword = $this->_get("keyword");
		if(!empty($keyword)){
			$field = "menuname|menutype|parent_id|pk_id|link_url|hid_link_url|first_category_id";
			$options["query"][$field] = array("like", sprintf("%%%s%%", $keyword));
		}
        $list = $Footmenu->getPageList($options);
		$this->assign($list);
		$this->display();
	}

}