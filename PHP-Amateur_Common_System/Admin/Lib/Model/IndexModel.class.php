<?php

class IndexModel extends Model {

    public function list_info($firstRow = 0, $listRows = 20){
        $stuArr = M("student")->field("`id`,`stu_id`,`stu_name`")->select();//选中student表中的stu_id和stu_name
        foreach($stuArr as $k => $v){
            $sids[$v['aid']] = $v;
        }
        //dump($sids);//ok
        unset($stuArr);

        $M = M("papers");
        $list = $M->field("`id`,`title`,`status`,`published`,`cid`,`aid`,`teacher`")->order("`published` DESC")->limit("$firstRow , $listRows")->select();
        foreach ($list as $k => $v) {
            $lids[$v['id']] = $v;
        }
        $statusArr = array("审核状态", "已发布状态");
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
            $list[$k]['teacher'] = $lids[$v['aid']]['teacher'];
        }
        dump($list);
        return $list;
    }
    


    

}

?>
