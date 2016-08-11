<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>用户编辑-权限管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='用户管理 > 用户编辑'; ?>
    <!--base href="<?php echo ($site["WEB_ROOT"]); ?>"/>
<link rel="stylesheet" type="text/css" href="<?php echo ($site["WEB_ROOT"]); ?>Public/Min/?f=../Public/Css/base.css|../Public/Css/layout.css|__PUBLIC__/Css/default.css<?php echo ($addCss); ?>" />
<js href="<?php echo ($site["WEB_ROOT"]); ?>Public/Min/?f=__PUBLIC__/Js/jquery-1.9.0.min.js|__PUBLIC__/Js/jquery.lazyload.js|__PUBLIC__/Js/functions.js|../Public/Js/base.js|__PUBLIC__/Js/jquery.form.js|__PUBLIC__/Js/asyncbox.js<?php echo ($addJs); ?>"/-->



        <base href="<?php echo ($site["WEB_ROOT"]); ?>"/>
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/base.css" />
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/default.css" />
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/layout.css" />
        <script type="text/javascript" src="__PUBLIC__/Js/jquery-1.9.0.min.js"></script>
        <script type="text/javascript" src="__PUBLIC__/Js/functions.js"></script>
        <script type="text/javascript" src="__PUBLIC__/Js/jquery.form.js"></script>
        <script type="text/javascript" src="__PUBLIC__/Js/asyncbox.js"></script>
        <script type="text/javascript" src="__PUBLIC__/Js/base.js"></script>
</head>
<body>
    <div class="wrap"> <div id="Top">
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
        <div class="mainBody"> <div id="Left">
    <div id="control" class=""></div>
    <div class="subMenuList">
        <div class="itemTitle"><?php if(MODULE_NAME == 'Index'): ?>常用操作<?php else: ?>子菜单<?php endif; ?> </div>
        <ul>
            <?php if(is_array($sub_menu)): foreach($sub_menu as $key=>$sv): ?><li><a href="<?php echo ($sv["url"]); ?>"><?php echo ($sv["title"]); ?></a></li><?php endforeach; endif; ?>
        </ul>
    </div>
</div>
            <div id="Right">
                <div class="contentArea">
                    <div class="Item hr">
                        <div class="current">用户编辑</div>
                    </div>
                    <form action="<?php echo U('Access/updata');?>" method="post">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                            <tr>
                                <th>新密码：</th>
                                <td><input class="input" name="user_pwd" type="password" size="40" value="<?php echo ($data_info["user_pwd"]); ?>" /></td>
                            </tr>
                            <tr>
                                <th>状态：</th>
                                <td>
                                    <select name="status" style="width: 100px;">
                                        <?php if($role_info["role_id"] == 1 ): ?><option value="1" selected>启用</option>
                                        <?php else: ?>
                                          <?php if($data_info["status"] == 1 ): ?><option value="1" selected>启用</option>
                                            <option value="0">禁用</option>
                                            <?php else: ?>
                                            <option value="1">启用</option>
                                            <option value="0" selected>禁用</option><?php endif; endif; ?>
                                    </select>***如果禁用了将无法登陆本系统***
                                </td>
                            </tr>
                            <tr>
                                <th>所属用户组</th>
                                <td>
                                	<select name="role_id" style="width: 100px;">
                                        <?php if($role_info["role_id"] == 1): ?><option value="1" selected>超级管理员</option><?php endif; ?>                                        
                                        <?php if($role_info["role_id"] == 2): ?><option value="2" selected>管理员</option>
                                            <option value="3" >老师</option>
                                            <option value="4" >学生</option><?php endif; ?>
                                        <?php if($role_info["role_id"] == 3): ?><option value="2" >管理员</option>
                                            <option value="3" selected>老师</option>
                                            <option value="4" >学生</option><?php endif; ?>
                                        <?php if($role_info["role_id"] == 4): ?><option value="2" >管理员</option>
                                            <option value="3" >老师</option>
                                            <option value="4" selected>学生</option><?php endif; ?>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>备注：</th>
                                <td><textarea name="remark" rows="5" cols="57"><?php echo ($data_info["remark"]); ?></textarea></td>
                            </tr>
                        </table>
                                <input type="hidden" name="user_id" value="<?php echo ($data_info["user_id"]); ?>"/>
                                <input type="hidden" name="user_name" value="<?php echo ($data_info["user_name"]); ?>"/>
                                <input type="hidden" name="time" value="<?php echo ($data_info["time"]); ?>"/>
                         <div class="commonBtnArea">
                                <button class="btn submit">提交</button>
                         </div>
                    </form>
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
<script type="text/javascript">
    $(".submit").click(function(){
        if($.trim($("input[name='user_pwd']").val())==''){
            popup.alert("密码不能为空");
            return false;
        }
        </if>
    });
</script>
</body>
</html>