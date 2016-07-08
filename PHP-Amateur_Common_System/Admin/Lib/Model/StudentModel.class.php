<?php 

class StudentModel extends Model
{
    /**
     * @return 读取学生基本信息
     */
	public function showInfo(){
        $stuInfo =  M('User');
        $condition['user_name'] = session('username');
        $info  =  $stuInfo->where($condition)->select();
        return $info;
    }

/**
  * @return 读取代管学生基本信息
  */
    public function showHostedInfo(){
        $stuHostedInfo =  M('Student');
        $HostedInfo  =  $stuHostedInfo->field("`stu_id`,`stu_name`,`uuf_id`,`stu_mobile`,`stu_major`")->select();
        foreach($HostedInfo as $k => $v){
            $hids[$v['stu_id']] = $v;
        }
        
        foreach ($HostedInfo as $k => $v) {
            $HostedInfo[$k]['stuID'] = $hids[$v['stu_id']]['stu_id'];
            $HostedInfo[$k]['stuName'] = $hids[$v['stu_id']]['stu_name'];
            $HostedInfo[$k]['stuMajor'] =   $hids[$v['stu_id']]['stu_major'];
            $HostedInfo[$k]['stuTel'] = $hids[$v['stu_id']]['stu_mobile'];
        }
        return $HostedInfo;
}


    /**
     * @return 读取notice表信息
     */
    public function showNotice(){
    	$model = M('Ugp_notice');
    	$notice[] = $model->order('notice_update_time desc')->find();
    	return $notice;    //注意notice要声明成一个数组
    }

    /**
     * @return 读取各表信息，合成审核进度信息
     */
    public function listPapers($firstRow = 0, $listRows = 20) {
        
        foreach($info as $k => $v){
            $sids[$v['id']] = $v;
        }
        //dump($sids);//ok
        unset($info);

        $M = M("papers");
        $list = $M->field("`id`,`title`,`status`,`published`,`cid`,`aid`")->order("`published` DESC")->limit("$firstRow , $listRows")->select();
        $statusArr = array("审核状态", "完成状态");
        //dump($list);//ok

        $aidArr = M("Admin")->field("`aid`,`email`,`nickname`")->select();
        foreach ($aidArr as $k => $v) {
            $aids[$v['aid']] = $v;
        }
        //dump($aidArr);//ok
        //dump($aids);
        unset($aidArr);
        
        $cidArr = M("Category")->field("`cid`,`name`")->select();
        foreach ($cidArr as $k => $v) {
            $cids[$v['cid']] = $v;
        }
        //dump($cidArr);//ok
        //dump($cids);
        unset($cidArr);
        
        foreach ($list as $k => $v) {
            $list[$k]['aidName'] = $aids[$v['aid']]['nickname'] ==' '? $aids[$v['aid']]['email'] : $aids[$v['aid']]['nickname'];
            $list[$k]['status'] = $statusArr[$v['status']];
            $list[$k]['cidName'] = $cids[$v['cid']]['name'];
            $list[$k]['stuId'] =   $sids[$v['id']]['stu_id'];
            $list[$k]['stuName'] = $sids[$v['id']]['stu_name'];
        }
        //dump($list);
        return $list;
    }


}

 ?>