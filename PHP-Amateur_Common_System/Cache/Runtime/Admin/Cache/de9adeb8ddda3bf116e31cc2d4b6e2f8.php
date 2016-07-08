<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>老师管理-评分-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='老师管理 > 评分'; ?>
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/base.css" />
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/default.css" />
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/layout.css" />
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
                        <div class="current">论文评分</div>
                    </div>
                    <form action="<?php echo U('Teacher/update');?>" method="post">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab">
                            <thead>
                                <tr>
                                    <td>论文格式(10)</td>
                                    <td>主体内容(40)</td>
                                    <td>代码质量(20)</td>
                                    <td>完成程度(15)</td>
                                    <td>心得总结(15)</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr align="center">
                                    <td><input class="input" name="format" id="format" size="15" type="format" /></td>
                                    <td><input class="input" name="content" id="content" size="15" type="content" /></td>
                                    <td><input class="input" name="quality" id="quality" size="15" type="quality" /></td>
                                    <td><input class="input" name="complete" id="complete" size="15" type="complete" /></td>
                                    <td><input class="input" name="summary" id="summary" size="15" type="summary" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="commonBtnArea" >
                            <span class="fr" id="opStatus" style="width:450px; display: none; margin: -8px; line-height: 16px;"></span>
                            <button class="btn submit" type="">提交</button>
                        </div>
                    </form>
                    
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
        if($.trim($("input[name='format']").val())==''){
            popup.alert("论文格式分数不能为空");
            return false;
        }
        if($.trim($("input[name='content']").val())==''){
            popup.alert("主体内容分数不能为空");
            return false;
        }
        if($.trim($("input[name='quality']").val())==''){
            popup.alert("代码质量分数不能为空");
            return false;
        }
        if($.trim($("input[name='complete']").val())==''){
            popup.alert("完成程度分数不能为空");
            return false;
        }
        if($.trim($("input[name='summary']").val())==''){
            popup.alert("心得总结分数不能为空");
            return false;
        }
    });
</script>
    </body>
</html>