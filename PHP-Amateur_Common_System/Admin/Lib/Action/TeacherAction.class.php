<?php

class TeacherAction extends CommonAction {

public $list;
/**
  *@return 列出系统中列出代管学生的名单
  */
public function index() {
    $this->assign("stuInfo",D("Student")->showHostedInfo());
    $this->display();
}

/**
 * @return 初次审核
 */
public function concrete(){
       $condition['uuf_last_review_record_id'] = 2;
       $condition['uuf_teacher_id'] = session('username');
       $list  = M('Ugp_uploaded_file')->field("`uuf_id`,`uuf_true_name`,`uuf_last_update_record_id`,`ufc_id`,`uuf_user_id`,`urr_id`")->order("`uuf_last_update_record_id` DESC")->where($condition)->select();
       foreach ($list as $k => $v) {
           $fids[$v['uuf_id']] = $v;
       }

       $status = M('Uf_review_record')->select();
       foreach($status as $k => $v){
           $rids[$v['urr_id']] = $v;   
        }
        unset($status);
        
        foreach ($list as $k => $v) {
            $list[$k]['fileName'] =  $fids[$v['uuf_id']]['uuf_true_name'];
            $list[$k]['status']   =  $rids[$v['urr_id']]['urr_status'];
            $list[$k]['uploadTime']    =  $fids[$v['uuf_id']]['uuf_last_update_record_id'];
            $list[$k]['uploader']  =  $fids[$v['uuf_id']]['uuf_user_id'];
        }
        //var_dump($list);
        $this->assign('list',$list);
       
        $pngName = M('Ugp_uploaded_png');
        //$condition1['stu_id'] = '2014220301006';
        //dump(cookie(cookie('uids')));
        //$png = $pngName->where($condition1)->select();
        $png = $pngName->select();
        $this->assign('png',$png);
        $this->display();
}    
   
/**
 * @return 退回所上传的文件
 */
public function sendBack(){
      $p = session('uid');
      $file = M('ugp_uploaded_file');
      $fileFlag = $file->select();
      $file->where(array('uuf_user_id'=>$p))->setField('uuf_teacher_id',0);
      $info = $file->where(array('uuf_user_id'=>$p))->field(`uuf_sort`)->select();
      if($info ==1)
      $file->where(array('uuf_user_id'=>$p))->setField('uuf_sort',0);
      $this->success("已成功退回！");
  }

/**
 * 打分
 * @return 
 */
public function mark(){
    $uid = $_GET['uids'];
    if($uid){ 
      session('uid',$uid);
    }
    $p=session('uid');
    $this -> display();
  }

/**
 * @return 提交各项分数 
 */
public function update(){
  if($_POST){
  $file = M('ugp_uploaded_file');
  $fileFlag = $file->select();
  $score = M("Ugp_score"); 
  $p = session('uid');
  $result = $score->where("uuf_user_id=".$p)->select(); //用于复审打分判断
  if(!empty($result)){
    $score->where(array('uuf_user_id'=>$p))->setField('konwledge',$_POST['konwledge']); 
    $score->where(array('uuf_user_id'=>$p))->setField('format',$_POST['format']);
    $score->where(array('uuf_user_id'=>$p))->setField('content',$_POST['content']);
    $score->where(array('uuf_user_id'=>$p))->setField('quality',$_POST['quality']);
    $score->where(array('uuf_user_id'=>$p))->setField('complete',$_POST['complete']);
    $score->where(array('uuf_user_id'=>$p))->setField('summary',$_POST['summary']);
    $sum = $_POST['konwledge']+$_POST['format']+$_POST['content']+$_POST['quality']+$_POST['complete']+$_POST['summary'];
    $score->where(array('uuf_user_id'=>$p))->setField('score',$sum);
    $file->where(array('uuf_user_id'=>$p))->setField('uuf_teacher_id',0);
    $file->where(array('uuf_user_id'=>$p))->setField('uuf_sort',2);
    $this->success('更新成功！',U('index'));
  }else{ 
      $p = session('uid');
      $score1 = M('Ugp_score');
      $data['uuf_user_id'] = $p;
      $data['konwledge'] = $_POST['konwledge'];
      $data['format'] = $_POST['format'];
      $data['content'] = $_POST['content'];
      $data['quality'] = $_POST['quality'];
      $data['complete'] = $_POST['complete'];
      $data['summary'] = $_POST['summary'];
      $sum = $_POST['konwledge']+$_POST['format']+$_POST['content']+$_POST['quality']+$_POST['complete']+$_POST['summary'];
      $data['score'] = $sum;
      $list = $score1->add($data);
      if ($list != false) {
           $this->success('提交成功！',U('index'));
        } else {
            $this->error('提交失败!');
        }
     $file->where(array('uuf_user_id'=>$p))->setField('uuf_teacher_id',0);
     $file->where(array('uuf_user_id'=>$p))->setField('uuf_sort',1);
    }
     
      if($fileFlag[0]['uuf_last_review_record_id'] == 0){
         $file->where(array('uuf_user_id'=>$p))->setField('uuf_last_review_record_id',1);
      }else if($fileFlag[0]['uuf_last_review_record_id'] == 1){
        $file->where(array('uuf_user_id'=>$p))->setField('uuf_last_review_record_id',2);
      }else{
        $file->where(array('uuf_user_id'=>$p))->setField('uuf_last_review_record_id',3);
      }
  }
    
    
}

/**
 * @return 复查
 */
public function review(){
  $condition['uuf_last_review_record_id'] = 3;
  $condition['uuf_teacher_id'] = session('username');
  $list  = M('Ugp_uploaded_file')->field("`uuf_id`,`uuf_true_name`,`uuf_last_update_record_id`,`ufc_id`,`uuf_user_id`,`urr_id`,`uuf_last_review_record_id`")->order("`uuf_last_update_record_id` DESC")->where($condition)->select();
       foreach ($list as $k => $v) {
           $fids[$v['uuf_id']] = $v;
       }

       $status = M('Uf_review_record')->select();
       foreach($status as $k => $v){
           $rids[$v['urr_id']] = $v;   
        }
        unset($status);
        
        foreach ($list as $k => $v) {
            $list[$k]['fileName'] =  $fids[$v['uuf_id']]['uuf_true_name'];
            $list[$k]['status']   =  $rids[$v['urr_id']]['urr_status'];
            $list[$k]['uploadTime']    =  $fids[$v['uuf_id']]['uuf_last_update_record_id'];
            $list[$k]['uploader']  =  $fids[$v['uuf_id']]['uuf_user_id'];
        }
        //var_dump($list);
        $this->assign('list',$list);
       
        $pngName = M('Ugp_uploaded_png');
        $condition1['stu_id'] = cookie(cookie('uids'));
        $png = $pngName->where($condition1)->select();
        $this->assign('png',$png);
        $this->display();
}

/**
 *@return 抽查 
 */
public function spotcheck(){
    $field = isset($_GET['field'])?$_GET['field']:'';
    $keyword = isset($_GET['keyword'])?htmlentities($_GET['keyword']):'';
    $where = '***';
    $prefix = C('DB_PREFIX');
    if($keyword <>''){
      /*if($field=='user'){
        $where = "Ugp_uploaded_file.user LIKE '%$keyword%'";
      }*/
      if($field=='user'){
        $where = "{$prefix}Ugp_uploaded_file.uuf_user_id LIKE '%$keyword%'";
      }
      if($field=='status'){
        $where = "Ugp_uploaded_file.uuf_status LIKE '%$keyword%'";
      }
      if($field=='updateTime'){
        $where = "Ugp_uploaded_file.uuf_last_update_record_id LIKE '%$keyword%'";
      }
    }
    
    $user = M('Ugp_uploaded_file');
    $list  = $user->where($where)->select();
    $this->assign('list',$list);  
    $pngName = M('Ugp_uploaded_png');
    $condition1['stu_id'] = $_GET['keyword'];
    $png = $pngName->where($condition1)->select();
    $this->assign('png',$png);
    $this->display();
}

/**
 * @return 删除
 */
public function del(){
        
        $uids = isset($_REQUEST['uids'])?$_REQUEST['uids']:false;
        //uid为1的禁止删除
        if($uids==1 or !$uids){
            $this->error('参数错误！');
        }
        if(is_array($uids)) 
        {
            foreach($uids as $k=>$v){
                if($v==1){//uid为1的禁止删除
                    unset($uids[$k]);
                }
                $uids[$k] = intval($v);
            }
            if(!$uids){
                $this->error('参数错误！');
                $uids = implode(',',$uids);
            }
        }

        $map['uid']  = array('in',$uids);
        if(M('member')->where($map)->delete()){
            M('auth_group_access')->where($map)->delete();
            addlog('删除会员UID：'.$uids);
            $this->success('恭喜，用户删除成功！');
        }else{
            $this->error('参数错误！');
        }
    }
}
?>