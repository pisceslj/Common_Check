<?php

class CommonAction extends Action {

    /**
     * 初始化
     * 如果 继承本类的类自身也需要初始化那么需要在使用本继承类的类里使用parent::_initialize();
     */
   public function _initialize() {
        header("Content-Type:text/html; charset=utf-8");
        header('Content-Type:application/json; charset=utf-8');
        $systemConfig = include WEB_ROOT . 'Common/systemConfig.php';//引入系统配置文件

        if (empty($systemConfig['TOKEN']['admin_marked'])) {
            $systemConfig['TOKEN']['admin_marked'] = "SynX Studio-Headquarter QQ群：413688598";//实验中心工作室群号
            $systemConfig['TOKEN']['admin_timeout'] = 3600;
            $systemConfig['TOKEN']['member_marked'] = "http://202.115.16.61:8880/experiment/Login/login.xhtml";//试验中心
            $systemConfig['TOKEN']['member_timeout'] = 3600;
            F("systemConfig", $systemConfig, WEB_ROOT . "Common/");
        }     
        
        $this->assign("sub_menu", $this->show_sub_menu());//显示二级菜单栏，即左侧竖着那栏
        $this->assign("my_info", session('username'));
    }

/**
  * @return  显示左侧菜单
  */
public function show_sub_menu() {
        if(session('uid')==0){
            $big = MODULE_NAME == "Index" ? "Access" : MODULE_NAME;
        }else if(session('uid')>=1&session('uid')<=5000){
            $big = MODULE_NAME == "Index" ? "Teacher" : MODULE_NAME;
        }else{
            $big = MODULE_NAME == "Index" ? "Student"   : MODULE_NAME;
        }
        
        $cache = C('admin_sub_menu');
        $sub_menu = array();
        if ($cache[$big]) {
            $cache = $cache[$big];
            foreach ($cache as $url => $title) {
                $url = $big == "Student" ? $url : "$big/$url";
                $sub_menu[] = array('url' => U("$big/$url"), 'title' => $title);
            }
            return $sub_menu;
        } else {
            return $sub_menu[] = array('url' => '#', 'title' => "该菜单组不存在");
        }
    }
}