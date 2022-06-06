<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">

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
                    <%--<li class="icons dropdown">--%>
                    <%--    <a href="${pageContext.request.contextPath}/file/main" aria-expanded="false" target="ifd">--%>
                    <%--        <i class="mdi mdi-email-outline"></i>--%>
                    <%--        <!--邮箱消息-->--%>
                    <%--        <c:if  test="${countFileNoRead>0}">--%>
                    <%--            <span class="badge gradient-1 badge-pill badge-primary">${countFileNoRead}</span>--%>
                    <%--        </c:if>--%>
                    <%--    </a>--%>
                    <%--</li>--%>
                    <%--<li class="icons dropdown">--%>
                    <%--    <a href="${pageContext.request.contextPath}/work/ShowWork" aria-expanded="false" target="ifd">--%>
                    <%--        <i class="mdi mdi-bell-outline"></i>--%>
                    <%--        <!--消息提醒-->--%>
                    <%--        <c:if  test="${countWorkNoFinish>0}">--%>
                    <%--            <span class="badge badge-pill gradient-2 badge-primary">${countWorkNoFinish}</span>--%>
                    <%--        </c:if>--%>
                    <%--    </a>--%>
                    <%--</li>--%>

                    <li class="icons dropdown">
                        <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                            <span class="activity active"></span>
                            <img src="../images/user/1.png" height="40" width="40" alt="">
                        </div>
                        <div class="drop-down dropdown-profile   dropdown-menu">
                            <div class="dropdown-content-body">
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/employee/profile" target="ifd"><i class="icon-user"></i> <span>个人中心</span></a>
                                    </li>

                                    <hr class="my-2">
                                    <li>
                                        <a href="page-lock.html"><i class="icon-lock"></i> <span>锁屏</span></a>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/employee/logout"><i class="icon-key"></i> <span>退出登录</span></a></li>
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
                    <a href="${pageContext.request.contextPath}/todo/index" aria-expanded="false" target="ifd">
                        <i class="icon-speedometer menu-icon"></i><span class="nav-text">工作面板</span>
                    </a>
                </li>
                <li class="mega-menu mega-menu-sm">
                    <a href="${pageContext.request.contextPath}/notice/noticeList" aria-expanded="false" target="ifd">
                        <i class="icon-globe-alt menu-icon"></i><span class="nav-text" >通知</span>
                    </a>
                </li>
                <li class="mega-menu mega-menu-sm" >
                    <a href="${pageContext.request.contextPath}/file/main" aria-expanded="false" onclick="emailClick()" target="ifd">
                        <i class="icon-envelope menu-icon"></i> <span class="nav-text">邮箱</span>
                    </a>
                </li>
                <!--                    <li class="mega-menu mega-menu-sm">-->
                <!--                        <a href="file.html" aria-expanded="false">-->
                <!--                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">文件管理</span>-->
                <!--                        </a>-->
                <!--                    </li>-->
                <li class="mega-menu mega-menu-sm">
                    <a href="${pageContext.request.contextPath}/attendance/attendanceList" aria-expanded="false" target="ifd">
                        <i class="fa fa-calendar"></i><span class="nav-text">考勤</span>
                    </a>
                </li>
                <li class="mega-menu mega-menu-sm">
                    <a href="${pageContext.request.contextPath}/work/ShowWork" aria-expanded="false" target="ifd">
                        <i class="icon-note menu-icon"></i><span class="nav-text">工作事项</span>
                    </a>
                </li>
                <c:if test="${employee.userLevel>=3}">
                    <li class="mega-menu mega-menu-sm">
                        <a href="${pageContext.request.contextPath}/employee/manage" aria-expanded="false" target="ifd">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">员工管理</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${employee.userLevel>=4}">
                    <li class="mega-menu mega-menu-sm">
                        <a href="${pageContext.request.contextPath}/dept/manage" aria-expanded="false" target="ifd">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">部门管理</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${employee.userLevel>=4}">
                    <li class="mega-menu mega-menu-sm">
                        <a href="${pageContext.request.contextPath}/job/manage" aria-expanded="false" target="ifd">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">职位管理</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
    <!--Sidebar end-->

    <!--Content body start-->
    <div class="content-body">
        <div class="container-fluid">
            <iframe name="ifd" src="${pageContext.request.contextPath}/todo/index" style="margin-top: 10px; overflow: hidden;" width="100%" height="100%" onload="this.height=ifd.document.body.scrollHeight" scrolling="yes" frameborder="0"></iframe>
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
