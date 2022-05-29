<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--使用X-UA-Compatible来设置IE浏览器兼容模式 最新的渲染模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--
        viewport表示用户是否可以缩放界面；
        width指定视区的逻辑宽度；
        device-width指示视区宽度应为设备的屏幕的宽度；
       initial-scale指令用于设置Web页面的初始缩放比例
       initial-scale=1则将显示未经缩放的Web文档
    -->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>首页</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="../../css/style.css" rel="stylesheet">
    <!-- bootstrap图标库-->
    <link rel="stylesheet" href="../../css/bootstrap-icons.css">
    <!-- Custom Stylesheet -->
    <link href="../../plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body>

<div class="row">
    <!--任务-->
    <div class="col-lg-3 col-sm-6">
        <a href="${pageContext.request.contextPath}/work/ShowWork">
            <div class="card gradient-1">
                <div class="card-body">
                    <h3 class="card-title text-white">任务</h3>
                    <div class="d-inline-block">
                        <h2 class="text-white">5</h2>
                        <p class="text-white mb-0">Best wishes</p>
                    </div>
                    <span class="float-right display-5 opacity-5"><i class="icon-note menu-icon"></i></span>
                </div>
            </div>
        </a>
    </div>
    <!--签到-->
    <div class="col-lg-3 col-sm-6">
        <a href="${pageContext.request.contextPath}/attendance/attendanceList">
            <div class="card gradient-2">
                <div class="card-body">
                    <h3 class="card-title text-white">签到</h3>
                    <div class="d-inline-block">
                        <h2 class="text-white">99</h2>
                        <p class="text-white mb-0">Best wishes</p>
                    </div>
                    <span class="float-right display-5 opacity-5"><i class="icon-badge menu-icon"></i></span>
                </div>
            </div>
        </a>
    </div>
    <!--邮件-->
    <div class="col-lg-3 col-sm-6">
        <a href="${pageContext.request.contextPath}/file/main">
            <div class="card gradient-3">
                <div class="card-body">
                    <h3 class="card-title text-white">邮件</h3>
                    <div class="d-inline-block">
                        <h2 class="text-white">4565</h2>
                        <p class="text-white mb-0">Best wishes</p>
                    </div>
                    <span class="float-right display-5 opacity-5"><i class="fa fa-envelope"></i></span>
                </div>
            </div>
        </a>
    </div>
    <!--时间-->
    <div class="col-lg-3 col-sm-6">
        <div class="card gradient-4">
            <div class="card-body">
                <h3 class="card-title text-white">时间</h3>
                <div class="d-inline-block">
                    <h2 class="text-white" id="time"></h2>
                    <p class="text-white mb-0" id="time1"></p>
                </div>
                <span class="float-right display-5 opacity-5"><i class="fa fa-calendar"></i></span>
            </div>
        </div>
    </div>

</div>

<div class="row">
    <div class="col-lg-12 col-md-12">
        <div class="card">
            <div class="card-body px-0">
                <h4 class="card-title px-4 mb-3">Todo</h4>
                <div class="todo-list">
                    <div class="tdl-holder">
                        <div class="tdl-content">
                            <ul id="todo_list">
                                <%--TODO--%>
                                <c:forEach items="${todoList}" var="Todo">
                                    <li>
                                        <label>
                                            <c:if test="${Todo.todoFinish==0}">
                                                <input type="checkbox" onclick="finish(${Todo.todoId})"><i></i><span>${Todo.todoText}</span>
                                            </c:if>
                                            <c:if test="${Todo.todoFinish==1}">
                                                <input type="checkbox" checked onclick="unfinish(${Todo.todoId})"><i></i><span>${Todo.todoText}</span>
                                            </c:if>
                                            <a href='${pageContext.request.contextPath}/todo/delete?todoId=${Todo.todoId}' class="ti-trash"></a>
                                        </label>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="px-4">
                            <input type="text" class="tdl-new form-control" placeholder="Write new item and hit 'Enter'..." id="text">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--**********************************
    Scripts
***********************************-->
<script src="../../plugins/common/common.min.js"></script>
<script src="../../js/custom.min.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/gleek.js"></script>
<script src="../../js/styleSwitcher.js"></script>
<script src="../../js/jquery-3.6.0.js"></script>
<!--时间脚本-->
<script type="text/javascript">
    function showLocale(objD)
    {
        var str;
        var yy = objD.getYear();
        if(yy<1900) yy = yy+1900;
        var MM = objD.getMonth()+1;
        if(MM<10) MM = '0' + MM;
        var dd = objD.getDate();
        if(dd<10) dd = '0' + dd;
        var hh = objD.getHours();
        if(hh<10) hh = '0' + hh;
        var mm = objD.getMinutes();
        if(mm<10) mm = '0' + mm;
        var ss = objD.getSeconds();
        if(ss<10) ss = '0' + ss;
        var ww = objD.getDay();
        if (ww==0) ww="星期日";
        if (ww==1) ww="星期一";
        if (ww==2) ww="星期二";
        if (ww==3) ww="星期三";
        if (ww==4) ww="星期四";
        if (ww==5) ww="星期五";
        if (ww==6) ww="星期六";
        str = hh + ":" + mm + ":" + ss;
        return(str);
    }
    function showLocale1(objD)
    {
        var str;
        var yy = objD.getYear();
        if(yy<1900) yy = yy+1900;
        var MM = objD.getMonth()+1;
        if(MM<10) MM = '0' + MM;
        var dd = objD.getDate();
        if(dd<10) dd = '0' + dd;
        var hh = objD.getHours();
        if(hh<10) hh = '0' + hh;
        var mm = objD.getMinutes();
        if(mm<10) mm = '0' + mm;
        var ss = objD.getSeconds();
        if(ss<10) ss = '0' + ss;
        var ww = objD.getDay();
        if (ww==0) ww="星期日";
        if (ww==1) ww="星期一";
        if (ww==2) ww="星期二";
        if (ww==3) ww="星期三";
        if (ww==4) ww="星期四";
        if (ww==5) ww="星期五";
        if (ww==6) ww="星期六";
        str = yy + "-" + MM + "-" + dd + " " +  " " + ww ;
        return(str);
    }
    function tick()
    {
        var today,today1,today2,today3,today4;
        today = new Date();
        document.getElementById("time").innerHTML = showLocale(today);
        document.getElementById("time1").innerHTML = showLocale1(today);
        window.setTimeout("tick()", 1000);
    }
    tick();

    function finish(todoid) {
        window.location.href = '${pageContext.request.contextPath}/todo/finish?todoId=' + todoid;
    }
    function unfinish(todoid) {
        window.location.href = '${pageContext.request.contextPath}/todo/unfinish?todoId=' + todoid;
    }
    $(".form-control").keypress(function (even) {
        if (even.which == 13) {
            var text=document.getElementById("text").value;
            window.location.href = '${pageContext.request.contextPath}/todo/add?todoText=' + text;
        }
    });

</script>

</body>
</html>
