<?php
/**
 * 微信网页服务Api
 * @filename weixin.php
 * @description
 */

class weixinApi {
    protected $error = '';
    protected $appid = NULL;
    protected $secret = NULL;

    public function __construct($platform = 'PLATFORM_WEIXIN')
    {
        $this->appid = C('APPID');
        $this->secret = C('SECRET');;
    }

    public function wxCurlOpen($url, $limit = 0, $post = '', $cookie = '', $bysocket = FALSE, $ip = '', $timeout = 15, $block = TRUE) {
        /*   $data = file_get_contents($url);
          if($data = json_decode($data,true))
          {
              return $data;
          }else{
              $this->error = '';
              return false;
          }*/
        if (!$url)
            die('url is null');
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url); //The URL to fetch.
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_HEADER, 0); //TRUE to include the header in the output.
        //post
        if ($post) {
            curl_setopt($ch, CURLOPT_POST, 1); //TRUE to do a regular HTTP POST
            curl_setopt($ch, CURLOPT_POSTFIELDS, $post); //The full data to post in a HTTP "POST" operation.
        }
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //TRUE to return the transfer as a string of the return value of curl_exec() instead of outputting it out directly.
        curl_setopt($ch, CURLOPT_BINARYTRANSFER, 1); //TRUE to return the raw output
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout); //The maximum number of seconds to allow CURL functions to execute.
        if ($cookie)
            curl_setopt($ch, CURLOPT_COOKIE, $cookie); //The contents of the "Set-Cookie: " header to be used in the HTTP request.
        $data = curl_exec($ch);

        if($data = json_decode($data,true))
        {
            curl_close($ch);
            return $data;
        }else{
            $this->error = curl_error($ch);
            curl_close($ch);
            return false;
        }

    }

    /**
     * 获取access token
     * GET
     */
    function getAccess(){
        $data = S('wmall_wechat_access');
        $access = array();
        if(isset($data['extime']) && (SYS_TIME - $data['extime'] <800))
        {
            $access = $data['access'];
        }
        if(!$access){
            /*
            $appid='wx3efc605179b5f99c';
            $AppSecret='5a05e98900ee54155d0d9d36ead1593d';
            */
            $url='https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$this->appid.'&secret='.$this->secret;
            $access = $this->wxCurlOpen($url);
            $data = array(
                'extime'=>SYS_TIME,
                'access'=>$access,
            );
            S('wmall_wechat_access',$data);
        }

        return $access['access_token'];

    }


    /**
     * 创建菜单
     * POST
     */
    function createMenu($menu,$access = NULL){
        empty($access) && $access = $this->getAccess();
        $url='https://api.weixin.qq.com/cgi-bin/menu/create?access_token='.$access;
        $str=$menu;
        $pri=$this->wxCurlOpen($url,0,$str);
        return $pri;

    }


    /**
     * 获取用户信息
     * GET
     * $access 服务号access
     * https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN
     */
    public  function getWeiXinUser($code,$access=NULL){
        $openidData = $this->getOpenid($code);
        if(!isset($openidData['openid']))
        {
            return false;
        }
        //获取token
        // empty($access) && $access = $this->getAccess();
        $url = 'https://api.weixin.qq.com/sns/auth?access_token=' . $openidData['access_token'] . '&openid=' . $openidData['openid'];
        $authData=$this->wxCurlOpen($url);
        if($authData['errmsg'] != 'ok')
        {
            //刷新token
            $url = 'https://api.weixin.qq.com/sns/oauth2/refresh_token?&appid='.$this->appid . '&grant_type=refresh_token&refresh_token=' . $openidData['refresh_token'];
            $openidData=$this->wxCurlOpen($url);
        }
        if(!isset($openidData['openid']))
        {
            return false;
        }
        $openid = $openidData['openid'];
        $access = $openidData['access_token'];
        //获取用户信息
        $url='https://api.weixin.qq.com/sns/userinfo?access_token='.$access.'&openid='.$openid.'&lang=zh_CN';
        $pri=$this->wxCurlOpen($url);
        return $pri;

    }

    public function getUser($code)
    {
        $pri = $this->getWeiXinUser($code);
        Tool_Log::info(__FUNCTION__ .'|'.print_r($pri,true));
        $openid = $pri['openid'];
        $unionid = $pri['unionid'];
        if(empty($openid) || empty($unionid)){
            Tool_Log::err('openid 或者 unionid为空');
        }

        $userModel = new U_UserOpenidModel();
        $user = $userModel->getUserByOpenidAndUnionid($openid, $unionid);
        $wxUserInfo = array();
        if(isset($pri['nickname'])){
            $wxUserInfo['nickname'] = $pri['nickname'];
        }
        if(isset($pri['headimgurl'])){
            $wxUserInfo['headimgurl'] = $pri['headimgurl'];
        }
        $_SESSION['wxUserInfo'] = $wxUserInfo;
        if(!$user) {
            // 未绑定手机号的用户, openid存入session, 然后进绑定页面处理
            $_SESSION['openid'] = $pri['openid'];
            $_SESSION['unionid'] = $pri['unionid'];
            return false;
        }
        return $user;
    }

    /**
     * 获取用户openid
     * GET
     * $code  授权获得
     */
    public function getOpenid($code){
        $url='https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $this->appid. '&secret='.$this->secret . '&code='.$code.'&grant_type=authorization_code';
        $access=$this->wxCurlOpen($url);
        return $access;

    }

    public function getAuthorUrl($url='')
    {
        $scope = 'snsapi_userinfo';
        $state = '123';
        $url = $url ?  $url : get_url();
        $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $this->appid . '&redirect_uri=' . urlencode($url) . '&response_type=code&scope=' . $scope . '&state=' . $state . '#wechat_redirect';
        return $url;
    }


    public function getSignPackage($url = '') {
        $jsapiTicket = $this->getJsApiTicket();
        // 注意 URL 一定要动态获取，不能 hardcode.
        $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
        $url =  $url ? $url : "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

        $timestamp = time();
        $nonceStr = $this->createNonceStr();

        // 这里参数的顺序要按照 key 值 ASCII 码升序排序
        $string = "jsapi_ticket=$jsapiTicket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";

        $signature = sha1($string);

        $signPackage = array(
            "appId"     => $this->appid,
            "nonceStr"  => $nonceStr,
            "timestamp" => $timestamp,
            "url"       => $url,
            "signature" => $signature,
            "rawString" => $string
        );
        return $signPackage;
    }

    private function createNonceStr($length = 16) {
        $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $str = "";
        for ($i = 0; $i < $length; $i++) {
            $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        }
        return $str;
    }

    private function getJsApiTicket() {

        $data = mc_get('jsapi_ticket');
        $my_ticket = '';
        if(isset($data['extime']) && (SYS_TIME - $data['extime'] <3600))
        {
            $my_ticket = $data['ticket'];
        }
        if(!$my_ticket){
            $accessToken = $this->getAccess();
            $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=$accessToken";
            $access = $this->wxCurlOpen($url);
            $my_ticket =$access['ticket'];
            $data = array(
                'extime'=>SYS_TIME,
                'ticket'=>$my_ticket,
            );
            mc_set('jsapi_ticket',$data);
        }

        return $my_ticket;
    }


    private function httpGet($url) {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 500);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_URL, $url);

        $res = curl_exec($curl);
        curl_close($curl);

        return $res;
    }

    /**
     * 设置所属行业
     * $industryId1 公众号模板消息所属行业编号 请打开连接查看行业编号 http://mp.weixin.qq.com/wiki/17/304c1885ea66dbedf7dc170d84999a9d.html
     * $industryId2 公众号模板消息所属行业编号
     */
    public function setIndustry($industryId1, $industryId2){
        $accessToken = $this->getAccess();
        if(empty($accessToken)){
            return false;
        }
        $queryUrl = 'https://api.weixin.qq.com/cgi-bin/template/api_set_industry?access_token='.$accessToken;
        $template = array();
        $template['industry_id1'] = "$industryId1";
        $template['industry_id2'] = "$industryId2";
        $template = json_encode($template);
        return $this->wxCurlOpen($queryUrl, 0, $template);
    }


    /**
     * 获得模板ID
     * $templateIdShort 模板库中模板的编号，有“TM**”和“OPENTMTM**”等形式
     *
     * @return array("errcode"=>0, "errmsg"=>"ok", "template_id":"Doclyl5uP7Aciu-qZ7mJNPtWkbkYnWBWVja26EGbNyk")  "errcode"是0则表示没有出错
     */
    public function getTemplateId($templateIdShort){
        $accessToken = $this->getAccess();
        if(empty($accessToken)){
            return false;
        }
        if(SYS_RELEASE != '2' && SYS_RELEASE != '1'){
            Tool_Log::debug('为了保持数据的一致性，请同步线上数据到本地！');
            return false;
        }
        $queryUrl = 'https://api.weixin.qq.com/cgi-bin/template/api_add_template?access_token='.$accessToken;
        $template = array();
        $template['template_id_short'] = "$templateIdShort";
        $template = json_encode($template);
        $result = $this->wxCurlOpen($queryUrl, 0, $template);
        Tool_Log::debug(__FUNCTION__ ."|templateIdShort:{$templateIdShort}".'|' .print_r($result, true));
        if(!empty($result) && $result['errmsg'] == 'ok'){
            return $result['template_id'];
        }elseif ($result['errcode'] == 40001){
            return 40001;
        } else{
            return false;
        }
    }


    /**
     * 向用户推送模板消息
     * @param $data = array(
     *                  'first'=>array('value'=>'您好，您已成功消费。', 'color'=>'#0A0A0A')
     *                  'keynote1'=>array('value'=>'巧克力', 'color'=>'#CCCCCC')
     *                  'keynote2'=>array('value'=>'39.8元', 'color'=>'#CCCCCC')
     *                  'keynote3'=>array('value'=>'2014年9月16日', 'color'=>'#CCCCCC')
     *                  'keynote3'=>array('value'=>'欢迎再次购买。', 'color'=>'#173177')
     * );
     * @param $touser 接收方的OpenId。
     * @param $templateId 模板Id。在公众平台线上模板库中选用模板获得ID
     * @param $url URL
     * @param string $topcolor 顶部颜色， 可以为空。默认是红色
     * @return array("errcode"=>0, "errmsg"=>"ok", "msgid"=>200228332} "errcode"是0则表示没有出错
     *
     * 注意：推送后用户到底是否成功接受，微信会向公众号推送一个消息。
     */
    public function sendTemplateMessage($data, $openid, $templateId, $url, $topcolor='#FF0000'){
        $accessToken = $this->getAccess();
        if(empty($accessToken)){
            Tool_Log::debug(__FUNCTION__ . 'accesstoken 为空！');
            return false;
        }
        $queryUrl = 'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token='.$accessToken;
        $template = array();
        $template['touser'] = $openid;
        $template['template_id'] = $templateId;
        $template['url'] = $url;
        $template['topcolor'] = $topcolor;
        $template['data'] = $data;
        $template = json_encode($template);
        $result = $this->wxCurlOpen($queryUrl, 0, $template);
        Tool_Log::debug(__FUNCTION__ ."| template:{$template}".'|' .print_r($result, true));
        if(!empty($result) && $result['errmsg'] == 'ok'){
            return true;
        }else{
            return $result['errcode'];
        }
    }
}