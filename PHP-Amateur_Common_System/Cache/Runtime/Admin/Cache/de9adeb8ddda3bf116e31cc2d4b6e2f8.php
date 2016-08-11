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
                                    <td>序号</td>
                                    <td>评价项目</td>
                                    <td>能力目标</td>
                                    <td>分项占比</td>
                                    <td colspan="4">评判标准</td>
                                    <td>考核分数</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>对行业技术问题及相关技术方案的学习，认识情况</td>
                                    <td>AO1</td>
                                    <td>0.25</td>
                                    <td colspan="2">  认识、学习行业技术问题，<br>能在安全、环境、法律等约束条件下，<br>  通过技术经济评价对行业技术问题  <br>设计方案可行性进行研究。  </td>
                                    <td colspan="2">优秀[22.5，25]<br>良好[17.5,22.5)<br>中等[12.5,17.5)<br>较差[7.5 , 12.5)<br>不及格[ 0 , 7.5 )</td>
                                    <td><input class="input" name="format" id="format" size="5" type="format" /></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>对行业技术问题及相关技术方案的学习，认识情况</td>
                                    <td>AO2</td>
                                    <td>0.15</td>
                                    <td colspan="2">能分析、总结和归纳企业实训<br>执行过程中存在的主要问题，具有<br>良好的心理素质和应对风险与挑<br>战的能力；能综合应用工程管理原<br>理和经济决策方法开展计划。</td>
                                    <td colspan="2">优秀[13.5，15]<br>良好[10.5,13.5)<br>中等[7.5 ,10.5)<br>较差[ 4.5 , 7.5)<br>不及格[0 , 4.5 )</td>
                                    <td><input class="input" name="content" id="content" size="5" type="content" /></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>工具与技能学习情况</td>
                                    <td>AO2</td>
                                    <td>0.15</td>
                                    <td colspan="2">能够学习掌握获取技术、资源、<br>现代软件工程工具和信息技术<br>工具的能力。</td>
                                    <td colspan="2">优秀[13.5，15]<br>良好[10.5,13.5)<br>中等[7.5 ,10.5)<br>较差[ 4.5 , 7.5)<br>不及格[0 , 4.5 )</td>
                                    <td><input class="input" name="quality" id="quality" size="5" type="quality" /></td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>团队协作与交流情况</td>
                                    <td>AO3</td>
                                    <td>0.15</td>
                                    <td colspan="2">能够与项目组成员协作交流，<br>包括与其他学科的成员合作并开<br>展工作。</td>
                                    <td colspan="2">优秀[13.5，15]<br>良好[10.5,13.5)<br>中等[7.5 ,10.5)<br>较差[ 4.5 , 7.5)<br>不及格[0 , 4.5 )</td>
                                    <td><input class="input" name="complete" id="complete" size="5" type="complete" /></td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>对于职业岗位与职业素养的认识</td>
                                    <td>AO4</td>
                                    <td>0.15</td>
                                    <td colspan="2">能够评价复杂软件工程的解<br>决方案对社会、健康、安全、法律<br>以及文化的影响，并理解应承担的<br>责任；具有软件工程系统的质量、<br>环境、职业健康、安全和服务意识，<br>理解并遵守职业道德和规范。</td>
                                    <td colspan="2">优秀[13.5，15]<br>良好[10.5,13.5)<br>中等[7.5 ,10.5)<br>较差[ 4.5 , 7.5)<br>不及格[0 , 4.5 )</td>
                                    <td><input class="input" name="summary" id="summary" size="5" type="summary" /></td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>文档报告写作水平</td>
                                    <td>AO3</td>
                                    <td>0.15</td>
                                    <td colspan="2">企业实训总结报告结构严谨，<br>逻辑性强，论述层次清晰，语言准<br>确，文字流畅，符合规范要求。</td>
                                    <td colspan="2">优秀[13.5，15]<br>良好[10.5,13.5)<br>中等[7.5 ,10.5)<br>较差[ 4.5 , 7.5)<br>不及格[0 , 4.5 )</td>
                                    <td><input class="input" name="konwledge" id="konwledge" size="5" type="konwledge" /></td>
                                </tr>
                            </thead>
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
        if($.trim($("input[name='konwledge']").val())==''){
            popup.alert("序号1分数不能为空");
            return false;
        }
        if($.trim($("input[name='format']").val())==''){
            popup.alert("序号2分数不能为空");
            return false;
        }
        if($.trim($("input[name='content']").val())==''){
            popup.alert("序号3分数不能为空");
            return false;
        }
        if($.trim($("input[name='quality']").val())==''){
            popup.alert("序号4分数不能为空");
            return false;
        }
        if($.trim($("input[name='complete']").val())==''){
            popup.alert("序号5分数不能为空");
            return false;
        }
        if($.trim($("input[name='summary']").val())==''){
            popup.alert("序号6分数不能为空");
            return false;
        }
    });
</script>
    </body>
</html>