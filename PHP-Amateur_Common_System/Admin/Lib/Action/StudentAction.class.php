<?php

class StudentAction extends CommonAction {

public $Path;
/**
 * @return 显示学生主界面通知
 */
public function index() {
        $this->assign("notice", D("Student")->showNotice());//显示主页通知
        $this->display();
}

/**
 * @return 修改密码
 */
public function myInfo() {
        if (IS_POST) {
          if (md5($_POST['pwd0']) != session('password')) {
            $this->error("旧密码错误");
          }
          if (trim($_POST['pwd']) != trim($_POST['pwd1'])) {
            $this->error("两次密码不一致");
          }

          $M = M("User");
          $data['user_id'] = session('uid');
          $data['user_name']= session('username');
          $data['user_pwd'] = md5($_POST['pwd']);
          
          if ($M->save($data)) {
              $this->success('你的密码修改成功，请重新登录','../Login/index.html');
          } else {
              $this->error("密码修改失败");
          }
        }else {
            $this->display();
        }
}

/**
 * @return 进度检查
 */
public function process(){
        $file  =   M('Ugp_uploaded_file');
        $info1  =  $file->where("uuf_user_id=".session('username'))->select();
        $M = M("Ugp_score");
        $info = $M->where("uuf_user_id=".session('username'))->select();
        $tech = M('Teacher');
        $techInfo = $tech->where("tch_id=".$info1[0]['uuf_teacher_id'])->select();
        $status = M('Ugp_excecution_phase_code');
        $statusInfo = $status->where("uep_id=".$info1[0]['uuf_last_review_record_id'])->select();
        $process[0]['status'] = $statusInfo[0]['uep_name'];
        $process[0]['score'] = $info[0]['score'];
        $process[0]['time'] = $info1[0]['uuf_last_update_record_id'];
        $process[0]['teacher'] = $techInfo[0]['tch_name'];
        
        $this->assign('process', $process);
        $this->display();
}

/**
 * 上传文件
 * @return 调用Upload.class.php
 */
 public function upload() {
        if (!empty($_FILES)) {
            $this->_upload();   //如果有文件上传 上传附件
            //var_dump($p);
        }
        $this->assign("info", $this->getRoleListOption(array('tech_id' => 0)));
        $this->display();
    }

/**
 * 
 */
public function _upload(){
        import('ORG.Net.UploadFile');//导入上传类
        $upload = new UploadFile();
        $upload->maxSize    = 3292200;//设置上传文件大小
        $upload->allowExts  = explode(',', 'jpg,gif,png,jpeg,pdf,doc,docx');//设置上传文件类型
        $upload->savePath   = './Uploads/';       //设置附件上传目录
        $upload->saveRule   = 'uniqid';           //设置上传文件规则
        if (!$upload->upload()) {
            $this->error($upload->getErrorMsg()); //捕获上传异常
        } else {
            $uploadList = $upload->getUploadFileInfo();//取得成功上传的文件信息
            $path = 'D:/Project/wampserver/wamp/www/PHP-Amateur_Common_System/Uploads/';
            $p = $path.$uploadList[0]['savename'];
            $q = $path.'PNG';
            $Path = $this->pdf2png($p,$q);
        }
        //$str=file_get_contents($_FILE['file'][$uploadList[0]['savename']]); 
        //return $str;
        $uploadFile   = M('Ugp_uploaded_file');
        $categary  = M('Ugp_uf_categary');
        $condition['ufc_suffix']=$uploadList[0]['extension'];
        $ID  =  $categary->where($condition)->find();
        $stuInfo = D('Student')->showInfo();
        //var_dump($stuInfo);
        //保存当前数据对象
        $data['uuf_id'] = $stuInfo[0]['user_name'];         //文件上传ID 
        $data['ufc_id'] = $ID['ufc_id'];                //文件分类ID     
        $data['uuf_user_id'] = $stuInfo[0]['user_name'];   //上传人
        $data['uuf_true_name'] = $uploadList[0]['name']; //上传文件名
        $data['uuf_name'] = $uploadList[0]['savename'];   //存储文件名
        $data['uuf_path'] = $uploadList[0]['savepath'];   //数据根目录下的完整路径
        $data['uuf_is_paper_doc_submited'] = $_POST['doc'];           //是否提交纸质档
        $data['uuf_last_update_record_id'] = date('Y-m-d H:i:s',time());    //保存上传时间
        $data['uuf_last_review_record_id'] = 1;           //最后一次审核记录ID
        $data['uuf_teacher_id'] = 0;//$_POST['tech_id'];  
        $data['uuf_sort'] = 0;
        $list   = $uploadFile->add($data);
        
        $pngName = M('Ugp_uploaded_png');
        foreach($Path as $k => $v){
            $png['stu_id'] =  $stuInfo[0]['user_name'];
            $png['png_name'] = $v;
            $pngName->add($png);
        }
        
        if ($list != false) {
            $this->success('上传文件成功！',U("Student/index"));
        } else {
            $this->error('上传文件失败!');
        }
}
/**
 * 将上传的pdf文件转成jpg
 * @param   $PDF  上传的pdf文件
 * @param   $Path 文件所在路径
 * @return  返回转化文件名
 */
protected function pdf2png($PDF,$Path){
   if(!extension_loaded('imagick')){
       return false;
   }
   if(!file_exists($PDF)){
       return false;
   }
   $IM = new imagick();
   $IM->setResolution(120,120);
   $IM->setCompressionQuality(100);
   $IM->readImage($PDF);
   foreach($IM as $Key => $Var){
       $Var->setImageFormat('png');
       $temp = md5($Key.time()).'.png';
       $Filename = $Path.'/'.$temp;
       if($Var->writeImage($Filename)==true){
           $Return[]= $temp;
       }
   }
   return $Return;
}
   
private function getRoleListOption($info = array()) {
        Vendor('Category','','.class.php');
        $cat = new Category('Group', array('gid', 'pid', 'name'));
        $list = $cat->getList();               //获取分类结构
        $info['roleOption'] = "";
        foreach ($list as $v) {
            $disabled = $v['gid'] == 1 ? ' disabled="disabled"' : "";
            $selected = $v['gid'] == $info['tech_id'] ? ' selected="selected"' : "";
            $info['roleOption'].='<option value="' . $v['gid'] . '"' . $selected . $disabled . '>' . $v['name'] . '</option>';
        }
        return $info;
    }


}