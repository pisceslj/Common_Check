<?php 
Class LoginAction extends Action{
    
    /**
     * @return 登录页面主视图
     */
	  Public function index(){
		   $this->display();
	  } 
    
    /**
     * @return 生成验证码
     */
    public function verify_code() {
        $w = isset($_GET['w']) ? (int) $_GET['w'] : 50;
        $h = isset($_GET['h']) ? (int) $_GET['h'] : 30;
        import("ORG.Util.Image");
        Image::buildImageVerify(4, 1, 'png', $w, $h);
    }

   /**
     * @return 登录验证
     */
	public function login(){
         if (!IS_POST) halt('页面不存在');
            if(I('code','','md5') != session('verify')){//验证验证码
                $this->error('验证码错误');
            }
            
            $username = I('username');//用户输入的账号
            $pwd = I('password','','md5');
  
            $db = M('user');
            $user=$db->where(array('user_name' => $username))->find();
            
            if(!$user || $user['user_pwd'] != $pwd){
                $this->error('账号或密码错误');
            }
            
            session('uid',$user['user_id']);
            session('username',$user['user_name']);
            session('password',$user['user_pwd']);

            $M = M("Role_user");
            $role = $M->where("user_id=".session('uid'))->select();
        
            if($role[0]['role_id']==0){
                $this->redirect('Admin/Tpl/Access/index');
            }else if($role[0]['role_id']==3){
                $this->redirect('Admin/Tpl/Teacher/index');
            }else{
                $this->redirect('Admin/Tpl/Student/index');
            }
    }
   
}
 ?>
