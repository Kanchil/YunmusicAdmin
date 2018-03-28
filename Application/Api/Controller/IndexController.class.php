<?php
namespace Api\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
      $this->display();
    }
    //根据专辑获取歌曲列表
    public function getSongListByType(){
      $album_id = I('get.album_id',0);
      $limit = I('get.limit',10);
      //推荐位
      $position = I('get.position',0);
      $sql = "select song.id,song.name,song.artist_id,song.artist_name,song.cover_url,extend.listen_url,extend.down_url from ym_songs song left join ym_songs_extend extend on extend.mid = song.id
      where song.status = 1";
      if ($album_id > 0) {
        $sql .= " and song.album_id = ".$album_id;
      }
      if ($position > 0) {
        $sql .= " and song.position = ".$position;
      }
      $sql .= " order by song.add_time desc";
      if ($limit > 0) {
        $sql .= " limit ".$limit;
      }
      $data = M('songs')->query($sql);
      if (empty($data)) {
        $result['errorcode'] = 4000;
        $result['message'] = "获取歌曲失败！";
      }else{
        $result['errorcode'] = 200;
        $result['message'] = "获取歌曲成功！";
      }
      $result['data'] = $data;
      $this->ajaxReturn($result);
    }
    //根据歌曲名称搜索歌曲信息
    public function searchSongByName(){
      $songName = I('songname',null);
      $limit = I('limit',10);
      if ($songName == null) {
        $result['errorcode'] = 5000;
        $result['message'] = '搜索内容不能为空！' ;
        $this->ajaxReturn($result);
      }
      $sql = "select song.id,song.name,song.artist_id,song.artist_name,song.cover_url,extend.listen_url,extend.down_url from ym_songs song left join ym_songs_extend extend on extend.mid = song.id
      where song.name like '%".trim($songName)."%' and song.status = 1 order by song.add_time desc limit ".$limit;
      $data = M('songs')->query($sql);
      if (empty($data)) {
        $result['errorcode'] = 4000;
        $result['message'] = "获取歌曲失败！";
      }else{
        $result['errorcode'] = 200;
        $result['message'] = "获取歌曲成功！";
      }
      $result['data'] = $data;
      $this->ajaxReturn($result);
    }
    //用户注册
    function register(){
      $username = I('post.username');
      $password = $this->think_ucenter_md5(I('post.password'));
      if (empty($username) || empty($password)) {
        $result['errorcode'] = 4002;
        $result['message'] = '注册失败！用户名和密码不能为空';
        $this->ajaxReturn($result);
      }
      $isExist = M('Member')->where("nickname = '".trim($username)."'")->find();
      // var_dump($isExist);exit;
      if (count($isExist) > 0) {
        $result['errorcode'] = 4001;
        $result['message'] = '用户名已经存在！';
        $this->ajaxReturn($result);
        exit;
      }
      $user = array('nickname' => $username, 'password'=>$password, 'status' => 1);
      if(M('Member')->add($user)){
        $result['errorcode'] = 200;
        $result['message'] = '注册成功！';
      }else {
        $result['errorcode'] = 4000;
        $result['message'] = '注册失败！';
      }
      $this->ajaxReturn($result);

    }
    //用户登陆
    public function login(){
      $username = I('post.username');
      $password = $this->think_ucenter_md5(I('post.password'));
      if (empty($username) || empty($password)) {
        $result['errorcode'] = 4000;
        $result['message'] = '登陆失败！请核对您的用户名或者密码';
        $this->ajaxReturn($result);
      }
      $getPassword = M('Member')->where("nickname = '".trim($username)."'")->find();
      if (empty($getPassword)) {
      	$result['errorcode'] = 4000;
        $result['message'] = '登陆失败！请核对您的用户名或者密码';
        $this->ajaxReturn($result);
      }
      if($password == $getPassword['password']){
        $result['errorcode'] = 200;
        $result['message'] = '登陆成功！';
        $result['data'] = M('Member')->where(array('nickname'=>trim($username)))->field('uid,nickname')->select();
      }else{
        $result['errorcode'] = 4000;
        $result['message'] = '登陆失败！请核对您的用户名或者密码';
      }
      $this->ajaxReturn($result);
    }
    //用户退出
    public function logout(){
      $result['errorcode'] = 200;
      $result['message'] = '退出成功！';
      $this->ajaxReturn($result);
    }
    //密码的加密规则
    function think_ucenter_md5($str, $key = 'ThinkUCenter'){
    	return '' === $str ? '' : md5(sha1($str) . $key);
    }
    //获取用户云歌曲列表  根据用户id
    public function getFavoriteSongs(){
      // $songId = I('songId');
      $userId = I('get.userId');
      $where = array(
        'user_id' => $userId,
        'status' => 1
      );
      $data = M('user_yun')->where($where)->select();
      if (!empty($data)) {
        $songIdsArr = array();
        foreach ($data as $key => $value) {
          array_push($songIdsArr,$value['song_id']);
        }
        $songSql = "select song.id,song.name,song.artist_id,song.artist_name,song.cover_url,extend.listen_url,extend.down_url from ym_songs song left join ym_songs_extend extend on extend.mid = song.id
        where song.status = 1 and song.id in (".implode(',',$songIdsArr).")";
        $songs = M('songs')->query($songSql);
        $result['data'] = $songs;
        $result['errorcode'] = 200;
        $result['message'] = "成功！";
      }else{
        $result['errorcode'] = 4000;
        $result['message'] = "失败！";
      }
      return $this->ajaxReturn($result);
    }
    //收藏歌曲到云
    public function favoriteSong(){
      $userId = I('get.userId');
      $songId = I('get.songId');
      $where = array(
        'user_id' => $userId,
        'song_id' => $songId
      );
      $isExist = M('user_yun')->where($where)->count();
      if ($isExist) {
        $row = M('user_yun')->where($where)->save(array(
          'status' => 1,
          'updatetime' => time()
        ));
      }else{
        $row = M('user_yun')->data(array(
          'user_id' => $userId,
          'song_id' => $songId,
          'createtime' => time()
        ))->add();
      }
      if ($row) {
        $result['errorcode'] = 200;
        $result['message'] = "添加到云成功！";
      }else{
        $result['errorcode'] = 200;
        $result['message'] = "添加到云失败！";
      }
      $this->ajaxReturn($result);
    }
    //从云音乐列表中去除
    public function cancelFavorite(){
      $userId = I('get.userId');
      $songId = I('get.songId');
      $where = array(
        'user_id' => $userId,
        'song_id' => $songId
      );
      $row = M('user_yun')->where($where)->save(array(
        'status' => 2,
        'updatetime' => time()
      ));
      if ($row) {
        $result['errorcode'] = 200;
        $result['message'] = "移除音乐成功！";
      }else{
        $result['errorcode'] = 4000;
        $result['message'] = "移除音乐失败！";
      }
      $this->ajaxReturn($result);
    }
    //判断是否已收藏
    public function isFavoriate(){
      $userId = I("get.userId");
      $songId = I("get.songId");
      $row = M("user_yun")->where(array(
        'user_id' => $userId,
        'song_id' => $songId,
        'status' => 1
      ))->count();
      if ($row > 0) {  //已收藏
        $result['errorcode'] = 200;
        $result['data'] = true;
      }else{
        $result['errorcode'] = 200;
        $result['data'] = false;
      }
      $this->ajaxReturn($result);
    }
}
