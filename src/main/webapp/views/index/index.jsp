<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">

    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="https://unicons.iconscout.com/release/v3.0.6/css/line.css">

</head>

<body style="background-color: #2a2b3d">
<aside class="sidebar position-fixed top-0 left-0 overflow-auto h-100 float-left" id="show-side-navigation1">
    <i class="uil-bars close-aside d-md-none d-lg-none" data-close="show-side-navigation1"></i>
    <div class="sidebar-header d-flex justify-content-center align-items-center px-3 py-4">
        <img class="rounded-pill img-fluid" width="65" src="https://uniim1.shutterfly.com/ng/services/mediarender/THISLIFE/021036514417/media/23148907008/medium/1501685726/enhance" alt="">
        <div class="ms-2">
            <h5 class="fs-6 mb-0">
                <a class="text-decoration-none" href="#">${employee.employeeName}</a><span class="main-color"> ${employee.dept.deptName}:${employee.job.jobName}</span>
            </h5>
            <p class="mt-1 mb-0">Lorem ipsum dolor sit amet consectetur.</p>
        </div>
    </div>

    <!-- <div class="search position-relative text-center px-4 py-3 mt-2">
        <input type="text" class="form-control w-100 border-0 bg-transparent" placeholder="搜索一下">
        <i class="fa fa-search position-absolute d-block fs-6"></i>
    </div> -->

    <ul class="nav nav-pills flex-column mb-auto">
        <li>
            <i class="uil-estate fa-fw"></i><a href="../index/index.html"> 工作面板</a>
        </li>
        <li>
            <i class="uil-chart-pie-alt"></i><a href="/notice/noticeList"> 公告信息</a>
        </li>
        <!-- <li>
            <i class="uil-folder"></i><a href="..\fileManage\fileManage.html"> 文件管理</a>
        </li> -->
        <li>
            <i class="uil-panel-add"></i><a href="../SignIn/SignIn.html"> 考勤管理</a>
        </li>
        <li>
            <i class="uil-calendar-alt"></i><a href="../Schedule/Schedule.html"> 计划表</a>
        </li>
        <li>
            <i class="uil-envelope-download fa-fw"></i><a href="..\email\email.html"> 邮箱</a>
        </li>
        <li>
            <i class="uil-bag"></i><a href="../WorkItems/workItem.html"> 工作事项</a>
        </li>
        <li>
            <i class="uil-setting"></i><a href="#"> 设置</a>
        </li>
        <!-- <li class="has-dropdown">
            <i class="uil-panel-add"></i><a href="#"> Charts</a>
            <ul class="sidebar-dropdown list-unstyled">
                <li><a href="#">Lorem ipsum</a></li>
                <li><a href="#">ipsum dolor</a></li>
                <li><a href="#">dolor ipsum</a></li>
                <li><a href="#">amet consectetur</a></li>
                <li><a href="#">ipsum dolor sit</a></li>
            </ul>
        </li> -->
        <!-- <li class="">
            <i class="uil-map-marker"></i><a href="#"> Maps</a>
        </li> -->
    </ul>
</aside>

<section id="wrapper">
    <nav class="navbar navbar-expand-md">
        <div class="container-fluid mx-2">
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#toggle-navbar" aria-controls="toggle-navbar" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="uil-bars text-white"></i>
                </button>
                <a class="navbar-brand" href="#">自动化办公<span class="main-color">kit</span></a>
            </div>
            <div class="collapse navbar-collapse" id="toggle-navbar">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            设置
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li>
                                <a class="dropdown-item" href="#">My account</a>
                            </li>
                            <li><a class="dropdown-item" href="#">My inbox</a>
                            </li>
                            <li><a class="dropdown-item" href="#">Help</a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Log out</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="uil-comments-alt"></i><span>23</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="uil-bell"></i><span>98</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i data-show="show-side-navigation1" class="uil-bars show-side-btn"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="p-4">
        <div class="welcome">
            <div class="content rounded-3 p-3">
                <h1 class="fs-3">工作面板</h1>
                <p class="mb-0">您好！来看看今天的事务吧！</p>
            </div>
        </div>

        <!-- 原本是插入图表的地方 -->
        <section class="charts mt-4">
            <div class="chart-container p-3">
                <h1 style="color:white">通知</h1>
                <div style="height: 300px">
                    <%--<canvas id="chart1" width="100%"></canvas>--%>
                    <!--TODO-->
                    <!--数据列表-->
                    <table id="dataList"
                           class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                        <tr>
                            <th class="" style="padding-right: 0px"><input
                                    id="selall" type="checkbox" class="icheckbox_square-blue">
                            </th>
                            <th class="sorting_asc">ID</th>
                            <th class="sorting_desc">通知名</th>
                            <th class="sorting_asc sorting_asc_disabled">通知信息</th>
                            <th class="sorting_desc sorting_desc_disabled">通知时间</th>
                            <th class="sorting">通知的发布者</th>
                            <th class="sorting">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${noticeList}" var="Notice">
                            <tr bgcolor="#6495ed">
                                <td><input name="ids" type="checkbox"></td>
                                <td>${Notice.noticeId}</td>
                                <td>${Notice.noticeName}</td>
                                <td>${Notice.noticeInfo}</td>
                                <td>${Notice.noticeTime}</td>
                                <td>${Notice.employeeId}</td>
                                <td class="text-center">
                                    <a href="javascript:void(0);" onclick="delUser('${Notice.noticeId}')" class="btn bg-olive btn-xs">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                    <!--数据列表/-->
                </div>
            </div>
        </section>

        <section class="statistics mt-4">
            <div class="row">
                <div class="col-lg-4">
                    <div class="box d-flex rounded-2 align-items-center mb-4 mb-lg-0 p-3">
                        <i class="uil-envelope-shield fs-2 text-center bg-primary rounded-circle"></i>
                        <div class="ms-3">
                            <div class="d-flex align-items-center">
                                <h3 class="mb-0">1,245</h3> <span class="d-block ms-2">邮件</span>
                                <span class="d-block ms-2">${countFileNoRead}封未读</span>
                            </div>
                            <p class="fs-normal mb-0"></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="box d-flex rounded-2 align-items-center mb-4 mb-lg-0 p-3">
                        <i class="uil-file fs-2 text-center bg-danger rounded-circle"></i>
                        <div class="ms-3">
                            <div class="d-flex align-items-center">
                                <h3 class="mb-0">${countWorkNoFinish}</h3> <span class="d-block ms-2">工作事项</span>
                            </div>
                            <p class="fs-normal mb-0"></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="box d-flex rounded-2 align-items-center p-3">
                        <i class="uil-users-alt fs-2 text-center bg-success rounded-circle"></i>
                        <div class="ms-3">
                            <div class="d-flex align-items-center">
                                <h3 class="mb-0">${lineCount}</h3> <span class="d-block ms-2">同事在线</span>
                            </div>
                            <p class="fs-normal mb-0">点击进行沟通</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 原本是插入图表的地方 -->
        <section class="charts mt-4">
            <div class="row">
                <div class="col-lg-6">
                    <div class="chart-container rounded-2 p-3">
                        <h3 class="fs-6 mb-3">您当前未完成的工作事项</h3>
                        <%--<canvas id="myChart"></canvas>--%>
                        <!--TODO-->
                        <!--数据列表-->
                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right: 0px"><input
                                        id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="sorting_asc">ID</th>
                                <th class="sorting_desc">工作信息</th>
                                <th class="sorting_asc sorting_asc_disabled">工作发布时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${workNoFinishList}" var="Work">
                                <tr bgcolor="#6495ed">
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>${Work.workId}</td>
                                    <td>${Work.workText}</td>
                                    <td>${Work.workTime}</td>
                                    <td class="text-center">
                                        <a href="javascript:void(0);" onclick="delUser('${Work.workId}')" class="btn bg-olive btn-xs">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                        <!--数据列表/-->
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="chart-container rounded-2 p-3">
                        <h3 class="fs-6 mb-3">您已完成的工作事项</h3>
                        <%--<canvas id="myChart2"></canvas>--%>
                        <!--TODO-->
                        <!--数据列表-->
                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right: 0px"><input
                                        id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="sorting_asc">ID</th>
                                <th class="sorting_desc">工作信息</th>
                                <th class="sorting_asc sorting_asc_disabled">工作发布时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${workFinishList}" var="Work">
                                <tr bgcolor="#6495ed">
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>${Work.workId}</td>
                                    <td>${Work.workText}</td>
                                    <td>${Work.workTime}</td>
                                    <td class="text-center">
                                        <a href="javascript:void(0);" onclick="delUser('${Work.workId}')" class="btn bg-olive btn-xs">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                        <!--数据列表/-->
                    </div>
                </div>
            </div>
        </section>

        <!-- 原本是插入图表的地方 -->
        <section class="charts mt-4">
            <div class="chart-container p-3">
                <h1 style="color:white">个人计划表（参考微软todo）</h1>
                <div style="height: 300px">
                    <canvas id="chart3" width="100%"></canvas>
                </div>
            </div>
        </section>

        <section class="statis mt-4 text-center">
            <div class="row">
                <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <div class="box bg-primary p-3">
                        <i class="uil-eye"></i>
                        <h3>5,154</h3>
                        <p class="lead">Page views</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <div class="box bg-danger p-3">
                        <i class="uil-user"></i>
                        <h3>245</h3>
                        <p class="lead">User registered</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4 mb-md-0">
                    <div class="box bg-warning p-3">
                        <i class="uil-shopping-cart"></i>
                        <h3>5,154</h3>
                        <p class="lead">累计完成的工作事项</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="box bg-success p-3">
                        <i class="uil-feedback"></i>
                        <h3>5,154</h3>
                        <p class="lead">累计获得鼓励</p>
                    </div>
                </div>
            </div>
        </section>


    </div>
</section>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"></script>
<script type="text/javascript" src="../../js/bootstrap.js"></script>

</body>
