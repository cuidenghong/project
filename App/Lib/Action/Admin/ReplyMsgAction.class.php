<?php
/**
 * @filename MsgAction.php
 * @author Cui.D.H <360612637@qq.com>
 * @datetime 2015/11/18 16:57
 * @description 文本
 */

if(!defined('APP_NAME')) exit('Access Denied');

class ReplyMsgAction extends BaseAction
{

	public function index()
    {
		$ReplyMsg = D("ReplyMsg");
		$keyword = $this->_get("keyword");
		if(!empty($keyword)){
			$field = "keywords";
			$options["query"][$field] = array("like", sprintf("%%%s%%", $keyword));
		}
        $list = $ReplyMsg->getPageList($options);
		$this->assign($list);
		$this->display();
	}

    /**
     * 添加文本
     */
    public function add()
    {
        $this->assign("data", $data);
        $this->display();
    }

    /**
     * 保存文本
     */
    public function insert()
    {
        $ReplyMsg = D("ReplyMsg");
        $data = $this->_post();
        try
        {
            $ReplyMsg->insert($data);
            $this->success("添加成功");
        }
        catch(Exception $ex)
        {
            $this->error($ex->getMessage());
        }
    }

    /**
     * @param $id
     */
    public function edit($messageid)
    {
        $ReplyMsg = D("ReplyMsg");
        $data = $ReplyMsg->getInfo($id);
        $this->assign("data", $data);
        $this->display("add");
    }

    public function update(){
        $ReplyMsg = D("ReplyMsg");
        $data = $this->_post();
        try
        {
            $ReplyMsg->update($data);
            $this->success("编辑成功");
        }
        catch(Exception $ex)
        {
            $this->error($ex->getMessage());
        }
    }
}