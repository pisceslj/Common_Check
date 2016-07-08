<?php

class TeacherModel extends Model {

/**
  * @return 读取代管学生基本信息
  */
/*public function showHostedInfo(){
        $stuHostedInfo =  M('Student');
        $HostedInfo  =  $stuHostedInfo->select();
        //var_dump($HostedInfo);
        return $HostedInfo;
}*/



/**
 * @return 读取毕业设计信息
 */
public function spotCheck(){
       $field = isset($_GET['field'])?$_GET['field']:'';
       $keyword = isset($_GET['keyword'])?htmlentities($_GET['keyword']):'';

       $prefix = C('DB_PREFIX');//获取表前缀
       if($keyword <>''){
            if($field=='user'){
                $where = "{$prefix}member.user LIKE '%$keyword%'";
            }
            if($field=='classify'){
                $where = "{$prefix}member.classify LIKE '%$keyword%'";
            }
            if($field=='updateTime'){
                $where = "{$prefix}member.updateTime LIKE '%$keyword%'";
            }
            if($field=='status'){
                $where = "{$prefix}member.status LIKE '%$keyword%'";
            }
        }

        $user = M('member');
        $pagesize = 10;#每页数量
        $offset = $pagesize*($p-1);//计算记录偏移量
        $count = $user->count();
        
        $list  = $user->field("{$prefix}member.*,{$prefix}auth_group.id as gid,{$prefix}auth_group.title")->order($order)->join("{$prefix}auth_group_access ON {$prefix}member.uid = {$prefix}auth_group_access.uid")->join("{$prefix}auth_group ON {$prefix}auth_group.id = {$prefix}auth_group_access.group_id")->where($where)->limit($offset.','.$pagesize)->select();

        return $list;
    }

}

?>