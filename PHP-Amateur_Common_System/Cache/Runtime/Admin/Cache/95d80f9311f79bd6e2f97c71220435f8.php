<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>老师管理-初审任务-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='老师管理 > 初审任务'; ?>
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/base.css" />
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/default.css" />
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/layout.css" />
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/style.css" />
        <script type="text/javascript" src="__PUBLIC__/Js/jquery-1.9.0.min.js"></script>
        <script type="text/javascript" src="__PUBLIC__/Js/functions.js"></script>
        <script type="text/javascript" src="__PUBLIC__/Js/jquery.form.js"></script>
        <script type="text/javascript" src="__PUBLIC__/Js/asyncbox.js"></script>
        <script type="text/javascript" src="__PUBLIC__/Js/base.js"></script>
        <script type="text/javascript" src="__PUBLIC__/Js/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="__PUBLIC__/Js/app.js"></script>
    </head>
    <body>
        <div class="wrap">
            <div id="Top">
    <div class="logo"><a href="<?php echo ($site["WEB_ROOT"]); ?>"><img src="../Public/Img/logo.png" /></a></div>
    <div class="help"><a href="#">使用帮助</a><span><a href="#">关于</a></span></div>
    <div class="menu">
        <ul> <?php echo ($menu); ?> </ul>
    </div>
</div>
<div id="Tags">
    <div class="userPhoto"><img src="../Public/Img/userPhoto.jpg" /> </div>
    <div class="navArea">
        <div class="userInfo"><div><a href="<?php echo U('Webinfo/index');?>" class="sysSet"><span>&nbsp;</span>系统设置</a--> <a href="<?php echo U("Admin/Login/index");?>" class="loginOut"><span>&nbsp;</span>退出系统</a></div>欢迎您，<?php echo ($my_info); ?> | <a href="#">毕业设计审核</a></div>
        <div class="nav"><font id="today"><?php echo date("Y-m-d H:i:s"); ?></font>您的位置：<?php echo ($currentNav); ?></div>
    </div>
</div>
<div class="clear"></div>
            <div class="mainBody">
                <div id="Left">
    <div id="control" class=""></div>
    <div class="subMenuList">
        <div class="itemTitle"><?php if(MODULE_NAME == 'Index'): ?>常用操作<?php else: ?>子菜单<?php endif; ?> </div>
        <ul>
            <?php if(is_array($sub_menu)): foreach($sub_menu as $key=>$sv): ?><li><a href="<?php echo ($sv["url"]); ?>"><?php echo ($sv["title"]); ?></a></li><?php endforeach; endif; ?>
        </ul>
    </div>
</div>
                <div id="Right">
                    <div class="Item hr">
                        <div class="current">论文初审管理</div>
                    </div>
                    <form >
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab">
                            <thead>
                                <tr>
                                    <td width="90"><label><input name="" class="chooseAll" type="checkbox"/> 全选</label> <label><input name="" class="unsetAll" type="checkbox"/> 反选</label></td>
                                    <td>论文标题</td>
                                    <td>状态</td>
                                    <td>发布时间</td>
                                    <td>发布人</td>
                                    <td>操作</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$paper): $mod = ($i % 2 );++$i;?><tr align="center">
                                        <td class="center" width="90">
                                            <input class="uids" type="checkbox" name="uids[]" value="<?php echo ($paper['uuf_user_id']); ?>">
                                        </td>
                                        <td><?php echo ($paper["uuf_true_name"]); ?></td>
                                        <td><?php if($paper["status"] == 0): ?>未审核
                                        <?php elseif($paper["status"] == 1): ?>初审
                                        <?php elseif($paper["status"] == 2): ?>复审
                                        <?php else: ?>已审核<?php endif; ?></td>
                                        <td><?php echo ($paper["uuf_last_update_record_id"]); ?></td>
                                        <td><?php echo ($paper["uuf_user_id"]); ?></td>
                                        <td class="center">
                   <button type="button" class="btn btn-default" data-toggle="modal" data-target=".bs-example-modal-lg_1" ><a link="<?php echo U('Teacher/look');?>?uid=<?php echo ($paper['uuf_user_id']); ?>" >浏览</a></button>
                   <a href="<?php echo U('Teacher/mark');?>?uids=<?php echo ($paper['uuf_user_id']); ?>"><input type="button" class="btn btn-default" value="打分"></input></a>
                                        </td>
                                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                            </tbody>
                        </table>
                         <div class="commonBtnArea" >
                        <span class="fr" id="opStatus" style="width:450px; display: none; margin: -8px; line-height: 16px;"></span>
                         <a href="<?php echo U('Teacher/sendBack');?>?uids=<?php echo ($paper['uuf_user_id']); ?>"><input type="button" class="btn" value="退回初审论文"></input></a>
                    </div>
                    </form>
                    <div class="modal fade bs-example-modal-lg_1" tabindex="-1" role="dialog" aria-hidden="true">
                       <div class="modal-dialog modal-lg">
                           <div class="modal-content">
                                <?php if(is_array($png)): $i = 0; $__LIST__ = $png;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><img src="__UPLOAD__/PNG/<?php echo ($v["png_name"]); ?>" /><?php endforeach; endif; else: echo "" ;endif; ?>
                            </div>
                           <div class="modal-footer">
                                 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                           </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
       
        <div id="Bottom">© 2015 All rights reserved By <a href="http://www.ss.uestc.edu.cn/" target="_blank">电子科技大学信软学院</a></div>
<script type="text/javascript">
    $(window).resize(autoSize);
    $(function(){
        autoSize();
        $(".loginOut").click(function(){
            var url=$(this).attr("href");
            popup.confirm('你确定要退出吗？','你确定要退出吗',function(action){
                if(action == 'ok'){ 
                    window.location=url; 
                   session_unset();
                   session_destroy();
                }
            });
            return false;
        });

        var time=self.setInterval(function(){$("#today").html(date("Y-m-d H:i:s"));},1000);
    });

</script>

    </body>
</html>