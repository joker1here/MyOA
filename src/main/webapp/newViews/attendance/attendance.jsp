<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>考勤管理</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="../../css/style.css" rel="stylesheet">
    <!-- bootstrap图标库-->
    <link rel="stylesheet" href="../../css/bootstrap-icons.css">
    <!-- Custom Stylesheet -->
    <link href="../../plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="../../plugins/toastr/css/toastr.min.css" rel="stylesheet">
</head>
<body>
<%--TODO--%>
<input id="Message" type="hidden" value="${Message}">
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="general-button">
                    <button type="button" class="btn mb-1 btn-success" id="toastr-success-top-right" onclick="signUp();">上班打卡</button>
                    <button type="button" class="btn mb-1 btn-warning" id="toastr-info-top-right" onclick="signBack();">打卡签退</button>
                    <%--<button type="button" class="btn mb-1 btn-success" onclick="signUp();">上班打卡</button>--%>
                    <%--<button type="button" class="btn mb-1 btn-warning" onclick="signBack();">打卡签退</button>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">
                <div class="basic-list-group">
                    <ul class="list-group">
                        <li class="list-group-item active">当前时间：</li>
                        <li class="list-group-item">今天天气......</li>
                        <li class="list-group-item">每日格言：</li>
                        <li class="list-group-item">Porta ac consectetur ac</li>
                        <li class="list-group-item">Vestibulum at eros</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">考勤表</h4>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered zero-configuration">
                        <thead>
                        <tr>
                            <th>部门</th>
                            <th>职位</th>
                            <th>员工</th>
                            <th>上班时间</th>
                            <th>下班时间</th>
                            <th>工作时长</th>
                        </tr>
                        </thead>
                        <tbody>
                            <%--TODO--%>
                            <c:forEach items="${attendanceList}" var="Attendance">
                                <tr>
                                    <td>${Attendance.employee.dept.deptName}</td>
                                    <td>${Attendance.employee.job.jobName}</td>
                                    <td>${Attendance.employee.employeeName}</td>
                                    <td><fmt:formatDate value="${Attendance.signUpTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                    <td><fmt:formatDate value="${Attendance.signBackTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                    <td><%--@elvariable id="Math" type="java.lang.Math"--%>
                                    <fmt:formatNumber value="${Math.floor(Attendance.min/60)}" />小时 ${Attendance.min%60}分钟</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>部门</th>
                            <th>职位</th>
                            <th>员工</th>
                            <th>上班时间</th>
                            <th>下班时间</th>
                            <th>工作时长</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- #/ container -->
<%--Content body end--%>

<%--Scripts--%>
<script>
    function signUp() {
        console.log("signUp");
        window.location.href = '${pageContext.request.contextPath}/attendance/signUp';
    }
    function signBack() {
        console.log("signBack");
        window.location.href = '${pageContext.request.contextPath}/attendance/signBack';
    }
    function Message() {
        let message = document.getElementById("Message").value;
        //let message=$("#Message").val();
        // console.log("success");
        if(message !=  null && message.trim() !== ""){
            alert(message);
        }
    }
    window.onLoad=Message();
</script>
<script src="../../plugins/common/common.min.js"></script>
<script src="../../js/custom.min.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/gleek.js"></script>
<script src="../../js/styleSwitcher.js"></script>

<script src="../../plugins/tables/js/jquery.dataTables.min.js"></script>
<script src="../../plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
<!-- Toastr -->
<script src="../../plugins/toastr/js/toastr.min.js"></script>
<script src="../../plugins/toastr/js/toastr.init.js"></script>
<%--<script src="../../js/jquery-3.6.0.js"></script>--%>

</body>
</html>
