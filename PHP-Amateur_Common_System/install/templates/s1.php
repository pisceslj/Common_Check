<!doctype html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title><?php echo $Title; ?> - <?php echo $Powered; ?></title>
        <link rel="stylesheet" href="./css/install.css?v=9.0" />
    </head>
    <body>
        <div class="wrap">
            <?php require './templates/header.php'; ?>
            <div class="section">
                <div class="main cc">
                    <pre class="pact" readonly="readonly">

                                    <b>本通用审核系统包含以下功能：</b>

1、RBAC权限验证功能；
   便捷地对系统中用户进行管理。

2、简单通知发布版块；

3、分配多级审核功能；
   满足毕业设计的分批次审核的功能。

4、用户信息修改功能；

5、后台用户管理；
   可以对后台用户的权限进行禁用和修改，可以新增用户

6、后台角色管理；
   可以通过对角色进行禁用或开启来对一类用户进行管理


                                版权所有(c)2016，<a href="http://119.29.229.22" target="_blank" >FireWork Studio</a> 保留所有权力。</a></pre>
                </div>
                <div class="bottom tac"> <a href="./index.php?step=2" class="btn">接 受</a> </div>
            </div>
        </div>
        <?php require './templates/footer.php'; ?>
    </body>
</html>