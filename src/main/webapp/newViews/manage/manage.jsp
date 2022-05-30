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
<%--<div class="container-fluid">--%>
    <div class="row">
        <%--12列宽--%>
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">部门管理</h4>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered zero-configuration">
                            <thead>
                            <tr>
                                <th>员工</th>
                                <th>部门</th>
                                <th>职位</th>
                                <th>用户等级</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${employeeList}" var="Employee">
                                <tr>
                                    <td align="center" valign="center">${Employee.employeeName}</td>
                                    <td align="center" valign="center">${Employee.dept.deptName}</td>
                                    <td align="center" valign="center">${Employee.job.jobName}</td>
                                    <td align="center" valign="center">${Employee.userLevel}</td>
                                    <td align="center" valign="center">
                                        <c:if test="${Employee.userLevel<employee.userLevel}">
                                            <button name="eitBtn" class="btn btn-primary" data-toggle="modal" data-target="#basicModal" onclick="change(${Employee.employeeId})">修改</button>
                                            <button name="delBtn" class="btn  btn-danger" onclick="del(${Employee.employeeId})">删除</button>
                                        </c:if>
                                        <c:if test="${Employee.userLevel>=employee.userLevel}">权限不足！</c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
            <%--TODO--%>
            <input id="Message" type="hidden" value="${Message}">
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
    function change(employeeId) {
        window.location.href = '${pageContext.request.contextPath}/employee/change?employeeId='+employeeId;
    }
    function del(employeeId) {
        window.location.href = '${pageContext.request.contextPath}/employee/delete?employeeId='+employeeId;
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
