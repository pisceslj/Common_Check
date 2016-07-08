<?php

class AccessAction extends CommonAction {

/**
  * 管理员列表
  */
public function index() {
        $this->assign("list", D("Access")->adminList());//调用adminList函数
        $this->display();
}
  
/**
  * 任务分配
  */
public function taskAllocation(){
        $file = M("Ugp_uploaded_file");
        $info = $file->select();
        foreach($info as $k => $v){
            $tids[$v['uuf_id']] = $v;
            if($tids[$v['uuf_id']]['uuf_sort']== 0)
            {
               $stu = M("Student");
               $list = $stu->where("stu_id=" . $tids[$v['uuf_id']]['uuf_user_id'])->select();
               foreach($list as $k => $v){
                  $sids[$v['stu_id']] = $v;
                }
       
                foreach ($list as $k => $v) {
                  $list[$k]['major']    = $sids[$v['stu_id']]['stu_major'];
                  $list[$k]['stuId']    = $sids[$v['stu_id']]['stu_id'];
                  $list[$k]['stuName']  = $sids[$v['stu_id']]['stu_name'];
                }
            }
            $this->assign("list",$list);
        }
        $this->display();       
}

/**
 * @return 复审任务分配
 */
/**
  * 任务分配
  */
public function reTaskAllocation(){
        $file = M("Ugp_uploaded_file");
        $info = $file->select();
        foreach($info as $k => $v){
            $tids[$v['uuf_id']] = $v;
            if($tids[$v['uuf_id']]['uuf_sort']== 1)
            {
               $stu = M("Student");
               $list = $stu->where("stu_id=" . $tids[$v['uuf_id']]['uuf_user_id'])->select();
               foreach($list as $k => $v){
                  $sids[$v['stu_id']] = $v;
                }
       
                foreach ($list as $k => $v) {
                  $list[$k]['major']    = $sids[$v['stu_id']]['stu_major'];
                  $list[$k]['stuId']    = $sids[$v['stu_id']]['stu_id'];
                  $list[$k]['stuName']  = $sids[$v['stu_id']]['stu_name'];
                }
            }
            $this->assign("list",$list);
        }
        $this->display();       
}

/**
 * @return 任务分配
 */
public function allocation(){
    if (IS_POST) {
       $file = M("Ugp_uploaded_file");
       $schId = $_POST['schId'];
       $tchId = $_POST['tchId'];
       $file->where(array('uuf_user_id'=>$_GET['uid']))->setField('uuf_school_id',$schId);
       $file->where(array('uuf_user_id'=>$_GET['uid']))->setField('uuf_teacher_id',$tchId);
       $file->where(array('uuf_user_id'=>$_GET['uid']))->setField('uuf_sort',3);
        $file->where(array('uuf_user_id'=>$_GET['uid']))->setField('uuf_last_review_record_id',2);
            $this->success('添加成功！',U('Access/taskAllocation'));
        }else {
            $this->assign("info", $this->getSchOption(array('role_id' => 0)));
            $this->assign("tchInfo", $this->getTchOption(array('role_id' => 0)));
            $this->display();
        }
}

/**
 * @return 复审任务分配
 */
public function reallocation(){
    if (IS_POST) {
       $file = M("Ugp_uploaded_file");
       $schId = $_POST['schId'];
       $tchId = $_POST['tchId'];
       $file->where(array('uuf_user_id'=>$_GET['uid']))->setField('uuf_school_id',$schId);
       $file->where(array('uuf_user_id'=>$_GET['uid']))->setField('uuf_teacher_id',$tchId);
       $file->where(array('uuf_user_id'=>$_GET['uid']))->setField('uuf_sort',2);
       $file->where(array('uuf_user_id'=>$_GET['uid']))->setField('uuf_last_review_record_id',3);
            $this->success('添加成功！',U('Access/reTaskAllocation'));
        }else {
            $this->assign("info", $this->getSchOption(array('role_id' => 0)));
            $this->assign("tchInfo", $this->getTchOption(array('role_id' => 0)));
            $this->display();
        }
}

/**
 * 获取学院列表
 * @param  array  $info [description]
 * @return [type]       [description]
 */
private function getSchOption($info = array()) {
        Vendor('Category','','.class.php');
        $cat = new Category('School_code', array('sch_id', 'sch_name'));
        $list = $cat->getList();               //获取分类结构
        $info['schOption'] = "";
        foreach ($list as $v) {
            $disabled = $v['sch_id'] == 1 ? ' disabled="disabled"' : "";
            $selected = $v['sch_id'] == $info['role_id'] ? ' selected="selected"' : "";
            $info['schOption'].='<option value="' . $v['sch_id'] . '"' . $selected . $disabled . '>' . $v['sch_name'] . '</option>';
        }
        return $info;
}

/**
 * 获取老师列表
 * @return [type] [description]
 */
private function getTchOption(){
    Vendor('Category','','.class.php');
        $cat = new Category('Teacher', array('tch_id', 'tch_name'));
        $list = $cat->getList();               //获取分类结构
        $info['tchOption'] = "";
        foreach ($list as $v) {
            $disabled = $v['tch_id'] == 1 ? ' disabled="disabled"' : "";
            $selected = $v['tch_id'] == $info['role_id'] ? ' selected="selected"' : "";
            $info['tchOption'].='<option value="' . $v['tch_id'] . '"' . $selected . $disabled . '>' . $v['tch_name'] . '</option>';
        }
        return $info;
}

/**
 * 角色列表
 * @return [type] [description]
 */
public function roleList() {
        $this->assign("list", D("Access")->roleList());
        $this->display();
}

    public function addRole() {
        if (IS_POST) {
            $this->checkToken();
            header('Content-Type:application/json; charset=utf-8');
            echo json_encode(D("Access")->addRole());
        } else {
            $this->assign("info", $this->getRole());
            $this->display("editRole");
        }
    }

    public function editRole() {
        if (IS_POST) {
            $this->checkToken();
            header('Content-Type:application/json; charset=utf-8');
            echo json_encode(D("Access")->editRole());
        } else {
            $M = M("Role");
            $info = $M->where("id=" . (int) $_GET['id'])->find();
            if (empty($info['id'])) {
                $this->error("不存在该角色", U('Access/roleList'));
            }
            $this->assign("info", $this->getRole($info));
            $this->display();
        }
    }

/**
 * 角色禁用
 * @return [type] [description]
 */
public function opRoleStatus() {
    header('Content-Type:application/json; charset=utf-8');
    echo json_encode(D("Access")->opStatus("Role"));
}

    public function opSort() {
        $M = M("Node");
        $datas['id'] = (int) $this->_post("id");
        $datas['sort'] = (int) $this->_post("sort");
        header('Content-Type:application/json; charset=utf-8');
        if ($M->save($datas)) {
            echo json_encode(array('status' => 1, 'info' => "处理成功"));
        } else {
            echo json_encode(array('status' => 0, 'info' => "处理失败"));
        }
    }

/**
  * 添加管理员
  */
public function addAdmin() {
    if (IS_POST) {
        $p = D("Access")->addAdmin();
        if($p['status'] = 1)
            $this->success('添加成功！',U('Access/addAdmin'));
        }else {
            $this->assign("info", $this->getRoleListOption(array('role_id' => 0)));
            $this->display();
        }
}

    public function changeRole() {
        header('Content-Type:application/json; charset=utf-8');
        if (IS_POST) {
            $this->checkToken();
            echo json_encode(D("Access")->changeRole());
        } else {
            $M = M("Node");
            $info = M("Role")->where("id=" . (int) $_GET['id'])->find();
            if (empty($info['id'])) {
                $this->error("不存在该用户组", U('Access/roleList'));
            }
            $access = M("Access")->field("CONCAT(`node_id`,':',`level`,':',`pid`) as val")->where("`role_id`=" . $info['id'])->select();
            $info['access'] = count($access) > 0 ? json_encode($access) : json_encode(array());
            $this->assign("info", $info);
            $datas = $M->where("level=1")->select();
            foreach ($datas as $k => $v) {
                $map['level'] = 2;
                $map['pid'] = $v['id'];
                $datas[$k]['data'] = $M->where($map)->select();
                foreach ($datas[$k]['data'] as $k1 => $v1) {
                    $map['level'] = 3;
                    $map['pid'] = $v1['id'];
                    $datas[$k]['data'][$k1]['data'] = $M->where($map)->select();
                }
            }
            $this->assign("nodeList", $datas);
            $this->display();
        }
    }

/**
 * 后台用户编辑
 * @return [type] [description]
 */
public function editAdmin() {
       if (IS_POST) {
            header('Content-Type:application/json; charset=utf-8');
            echo json_encode(D("Access")->editAdmin());
        } else {
            $M = M("User");
            $uid = $_GET['uid'];
            $info = $M->where("`user_id`=" . $uid)->select();
            //var_dump($info[0]['user_id']);
            /*if (empty($info[0]['user_id'])) {
                $this->error("不存在该管理员ID", U('Access/index'));
            }
            if ($info['user_name'] == C('ADMIN_AUTH_KEY')) {
                $this->error("超级管理员信息不允许操作", U("Access/index"));
                exit;
            }*/
            $this->assign("info", $this->getRoleListOption($info));
            $this->display("addAdmin");
        }
}

    private function getRole($info = array()) {
        Vendor('Category','','.class.php');
        $cat = new Category('Role', array('id', 'pid', 'name', 'fullname'));
        $list = $cat->getList();               //获取分类结构
        foreach ($list as $k => $v) {
            $disabled = $v['id'] == $info['id'] ? ' disabled="disabled"' : "";
            $selected = $v['id'] == $info['pid'] ? ' selected="selected"' : "";
            $info['pidOption'].='<option value="' . $v['id'] . '"' . $selected . $disabled . '>' . $v['fullname'] . '</option>';
        }
        return $info;
    }

/**
 * 获取角色列表
 * @param  array  $info [description]
 * @return [type]       [description]
 */
private function getRoleListOption($info = array()) {
        Vendor('Category','','.class.php');
        $cat = new Category('Role', array('id', 'pid', 'name', 'fullname'));
        $list = $cat->getList();               //获取分类结构
        $info['roleOption'] = "";
        foreach ($list as $v) {
            $disabled = $v['id'] == 1 ? ' disabled="disabled"' : "";
            $selected = $v['id'] == $info['role_id'] ? ' selected="selected"' : "";
            $info['roleOption'].='<option value="' . $v['id'] . '"' . $selected . $disabled . '>' . $v['fullname'] . '</option>';
        }
        return $info;
}

    private function getPid($info) {
        $arr = array("请选择", "项目", "模块", "操作");
        for ($i = 1; $i < 4; $i++) {
            $selected = $info['level'] == $i ? " selected='selected'" : "";
            $info['levelOption'].='<option value="' . $i . '" ' . $selected . '>' . $arr[$i] . '</option>';
        }
        $level = $info['level'] - 1;
        import("Category");
        $cat = new Category('Node', array('id', 'pid', 'title', 'fullname'));
        $list = $cat->getList();               //获取分类结构
        $option = $level == 0 ? '<option value="0" level="-1">根节点</option>' : '<option value="0" disabled="disabled">根节点</option>';
        foreach ($list as $k => $v) {
            $disabled = $v['level'] == $level ? "" : ' disabled="disabled"';
            $selected = $v['id'] != $info['pid'] ? "" : ' selected="selected"';
            $option.='<option value="' . $v['id'] . '"' . $disabled . $selected . '  level="' . $v['level'] . '">' . $v['fullname'] . '</option>';
        }
        $info['pidOption'] = $option;
        return $info;
    }

/**
 * 删除文件记录
 * @return 
 */
public function del() {
        if (M("Ugp_uploaded_file")->where("uuf_user_id=" . $_GET['id'])->delete()) {
            M("Ugp_uploaded_png")->where("stu_id=".$_GET['id']->delete());
            $this->success("成功删除",U('Access/taskAllocation'));
        } else {
            $this->error("删除失败，可能是不存在该ID的记录");
        }
}

}