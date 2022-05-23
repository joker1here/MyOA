<%--
  Created by IntelliJ IDEA.
  User: 32692
  Date: 2022/5/21
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>网上办公系统</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
    <!-- bootstrap图标库 -->
    <link rel="stylesheet" href="../css/bootstrap-icons.css">

</head>

<body>

<!--Preloader start-->
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
        </svg>
    </div>
</div>
<!--Preloader end-->


<!--Main wrapper start-->
<div id="main-wrapper">

    <!--Nav header start-->
    <div class="nav-header">
        <div class="brand-logo">
            <a>
                <b class="logo-abbr"><img src="../images/logo.png" alt=""> </b>
                <span class="logo-compact"><img src="../images/logo-compact.png" alt=""></span>
                <span class="brand-title">
                        <img src="../images/oa.png" alt="">
                </span>
            </a>
        </div>
    </div>
    <!--Nav header end-->

    <!--Header start-->
    <div class="header ">
        <div class="header-content clearfix">

            <div class="nav-control">
                <div class="hamburger">
                    <span class="toggle-icon"><i class="icon-menu"></i></span>
                </div>
            </div>
            <div class="header-right">
                <ul class="clearfix">
                    <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                        <i class="mdi mdi-email-outline"></i>
                        <!--邮箱消息-->
                        <span class="badge gradient-1 badge-pill badge-primary">4</span>
                    </a>
                        <div class="drop-down animated fadeIn dropdown-menu">
                            <div class="dropdown-content-heading d-flex justify-content-between">
                                <span class="">4 New Messages</span>
                            </div>
                            <div class="dropdown-content-body">
                                <ul>
                                    <li class="notification-unread">
                                        <a href="javascript:void()">
                                            <img class="float-left mr-3 avatar-img" src="../images/avatar/1.jpg" alt="">
                                            <div class="notification-content">
                                                <div class="notification-heading">Saiful Islam</div>
                                                <div class="notification-timestamp">08 Hours ago</div>
                                                <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-unread">
                                        <a href="javascript:void()">
                                            <img class="float-left mr-3 avatar-img" src="../images/avatar/2.jpg" alt="">
                                            <div class="notification-content">
                                                <div class="notification-heading">Adam Smith</div>
                                                <div class="notification-timestamp">08 Hours ago</div>
                                                <div class="notification-text">Can you do me a favour?</div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void()">
                                            <img class="float-left mr-3 avatar-img" src="../images/avatar/3.jpg" alt="">
                                            <div class="notification-content">
                                                <div class="notification-heading">Barak Obama</div>
                                                <div class="notification-timestamp">08 Hours ago</div>
                                                <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void()">
                                            <img class="float-left mr-3 avatar-img" src="../images/avatar/4.jpg" alt="">
                                            <div class="notification-content">
                                                <div class="notification-heading">Hilari Clinton</div>
                                                <div class="notification-timestamp">08 Hours ago</div>
                                                <div class="notification-text">Hello</div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </li>
                    <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                        <i class="mdi mdi-bell-outline"></i>
                        <!--消息提醒-->
                        <span class="badge badge-pill gradient-2 badge-primary">4</span>
                    </a>
                        <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                            <div class="dropdown-content-heading d-flex justify-content-between">
                                <span class="">4 New Notifications</span>

                            </div>
                            <div class="dropdown-content-body">
                                <ul>
                                    <li>
                                        <a href="javascript:void()">
                                            <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                            <div class="notification-content">
                                                <h6 class="notification-heading">Events near you</h6>
                                                <span class="notification-text">Within next 5 days</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void()">
                                            <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                            <div class="notification-content">
                                                <h6 class="notification-heading">Event Started</h6>
                                                <span class="notification-text">One hour ago</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void()">
                                            <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                            <div class="notification-content">
                                                <h6 class="notification-heading">Event Ended Successfully</h6>
                                                <span class="notification-text">One hour ago</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void()">
                                            <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                            <div class="notification-content">
                                                <h6 class="notification-heading">Events to Join</h6>
                                                <span class="notification-text">After two days</span>
                                            </div>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </li>

                    <li class="icons dropdown">
                        <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                            <span class="activity active"></span>
                            <img src="../images/user/1.png" height="40" width="40" alt="">
                        </div>
                        <div class="drop-down dropdown-profile   dropdown-menu">
                            <div class="dropdown-content-body">
                                <ul>
                                    <li>
                                        <a href="app-profile.html"><i class="icon-user"></i> <span>个人中心</span></a>
                                    </li>

                                    <hr class="my-2">
                                    <li>
                                        <a href="page-lock.html"><i class="icon-lock"></i> <span>锁屏</span></a>
                                    </li>
                                    <li><a href="page-login.html"><i class="icon-key"></i> <span>退出登录</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--Header end ti-comment-alt-->

    <!--Sidebar start-->
    <div class="nk-sidebar">
        <div class="nk-nav-scroll">
            <ul class="metismenu" id="menu">
                <li class="mega-menu mega-menu-sm">
                    <a href="index.html" aria-expanded="false" target="ifd">
                        <i class="icon-speedometer menu-icon"></i><span class="nav-text">工作面板</span>
                    </a>
                </li>
                <li class="mega-menu mega-menu-sm">
                    <a href="notice" aria-expanded="false" target="ifd">
                        <i class="icon-globe-alt menu-icon"></i><span class="nav-text" >活动公告</span>
                    </a>
                </li>
                <li class="mega-menu mega-menu-sm" >
                    <a href="email" aria-expanded="false" onclick="emailClick()" target="ifd">
                        <i class="icon-envelope menu-icon"></i> <span class="nav-text">邮箱</span>
                    </a>
                </li>
                <!--                    <li class="mega-menu mega-menu-sm">-->
                <!--                        <a href="file.html" aria-expanded="false">-->
                <!--                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">文件管理</span>-->
                <!--                        </a>-->
                <!--                    </li>-->
                <li class="mega-menu mega-menu-sm">
                    <a href="attendance" aria-expanded="false" target="ifd">
                        <i class="icon-badge menu-icon"></i><span class="nav-text">考勤管理</span>
                    </a>
                </li>
                <li class="mega-menu mega-menu-sm">
                    <a href="workItems" aria-expanded="false" target="ifd">
                        <i class="icon-note menu-icon"></i><span class="nav-text">工作事项</span>
                    </a>
                </li>
                <%--<<li class="mega-menu mega-menu-sm">--%>
                <%--    <a href="schedule.html" aria-expanded="false">--%>
                <%--        <i class="icon-notebook menu-icon"></i><span class="nav-text">计划表</span>--%>
                <%--   </a>-->--%>
                <%--</li>--%>
            </ul>
        </div>
    </div>
    <!--Sidebar end-->

    <!--Content body start-->
    <div class="content-body">
        <div class="container-fluid">
            <iframe name="ifd" src="index.html" style="margin-top: 10px; overflow: hidden;" width="100%" height="100%" onload="this.height=ifd.document.body.scrollHeight" scrolling="no" frameborder="0"></iframe>
        </div>
    </div>
    <!--Content body end-->


    <!--Footer start-->
    <div class="footer">
        <div class="copyright">
            <p>网上办公系统</p>
        </div>
    </div>
    <!--Footer end-->
</div>
<!--Main wrapper end-->

<!--Scripts-->
<script src="../plugins/common/common.min.js"></script>
<script src="../js/custom.min.js"></script>
<script src="../js/settings.js"></script>
<script src="../js/gleek.js"></script>
<script src="../js/styleSwitcher.js"></script>
<script src="../js/vue.min.js"></script>

</body>

</html>
