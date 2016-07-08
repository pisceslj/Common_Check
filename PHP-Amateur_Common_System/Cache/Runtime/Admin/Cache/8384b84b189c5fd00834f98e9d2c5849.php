<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>登录-<?php echo ($site["name"]); ?></title>
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/layout.css" />
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/base.css" />
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/default.css" />
        <script type="text/javascript" src="__PUBLIC__/Js/login.js"></script>
</head>

<body class="loginWeb">
    <div class="loginBox">
        <div class="innerBox">
            <div class="logo"> <img src="../Public/Img/logo.png" /></div>
            <form id="form1" action="<?php echo U("/Login/login");?>" method="post">
                <div class="loginInfo">
                    <ul>
                        <li class="row1">登录账号：</li>
                        <li class="row2"><input class="input" name="username" id="username" size="30" type="username" /></li>
                    </ul>
                    <ul>
                        <li class="row1">登录密码：</li>
                        <li class="row2"><input class="input" name="password" id="pwd" size="30" type="password" /></li>
                    </ul>
                    <ul>
                        <li class="row1">验证码：</li>
                        <li class="row2"><input class="input" id="verify_code" name="code" type="code" style="width:110px;" /> <img src="<?php echo U("/Login/verify_code");?>"  title="看不清？单击此处刷新" onclick="this.src+='?rand='+Math.random();"  style="cursor: pointer; vertical-align: middle;"/></li>
                    </ul>
                    <div class="clear"></div>
                   <div class="operation"><input type="submit" class="btn submit" value="登录" />
                    <input class="btn findPwd" value="忘记密码？" /></div>
                </div>
            </form>
        </div>
    </div>

</body>
</html>