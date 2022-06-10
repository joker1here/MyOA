<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>更改个人中心</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="../../plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
    <!-- Page plugins css -->
    <link href="../../plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
    <!-- Color picker plugins css -->
    <link href="../../plugins/jquery-asColorPicker-master/css/asColorPicker.css" rel="stylesheet">
    <!-- Date picker plugins css -->
    <link href="../../plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
    <!-- Daterange picker plugins css -->
    <link href="../../plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="../../plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <link href="../../css/style.css" rel="stylesheet">
</head>
<body>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="form-validation">
                        <form class="form-valide" action="${pageContext.request.contextPath}/employee/update" method="post">
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="EmployeeID">员工编号 <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-6">
                                    <input type="text" class="form-control" id="EmployeeID" name="EmployeeID" readonly unselectable="on" value="${employee.employeeId}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="username">姓名 <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-6">
                                    <input type="text" class="form-control" id="username" name="username" value="${employee.employeeName}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="password">登录密码 <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-6">
                                    <input type="password" class="form-control" id="password" name="password" value="${employee.pwd}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="address">住址 <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-6">
                                    <input type="text" class="form-control" id="address" name="address" value="${employee.address}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label">生日 <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-6">
                                    <input type="text" class="form-control" value="<fmt:formatDate value="${employee.birthday}" pattern="yyyy-MM-dd"/>" id="mdate" name="Birthday">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="val-email">邮箱 <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-6">
                                    <input type="text" class="form-control" id="val-email" name="email" value="${employee.email}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="val-sex">性别<span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-6">
                                    <select class="form-control" id="val-sex" name="sex">
                                        <option value="">请选择</option>
                                        <option value="1" <c:if test="${employee.sex==1}">selected</c:if>>男</option>
                                        <option value="0" <c:if test="${employee.sex==0}">selected</c:if>>女</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="userLevel">用户等级 <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-6">
                                    <input type="text" class="form-control" id="userLevel" name="userLevel" unselectable="on" value="${employee.userLevel}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="DeptId">部门 <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-6">
                                    <select class="form-control" id="DeptId" name="DeptId">
                                        <option value="" <c:if test="${employee.dept==null}">selected</c:if>></option>
                                        <c:forEach items="${deptList}" var="Dept">
                                            <option value="${Dept.deptName}" <c:if test="${employee.deptId==Dept.deptId}">selected</c:if>>${Dept.deptName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="JobId">职位 <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-6">
                                    <select class="form-control" id="JobId" name="JobId">
                                        <%--<option value="">请选择</option>--%>
                                        <option value="" <c:if test="${employee.job==null}">selected</c:if>></option>
                                        <c:forEach items="${jobList}" var="Job">
                                            <option value="${Job.jobName}" <c:if test="${employee.jobId==Job.jobId}">selected</c:if>>${Job.jobName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-8 ml-auto">
                                    <button type="submit" class="btn btn-primary">修改</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--TODO--%>
    <input id="Message" type="hidden" value="${Message}">
<!-- #/ container -->
<!--**********************************
    Content body end
***********************************-->
</body>
<!--**********************************
    Scripts
***********************************-->
<script>
    //TODO
    function Message() {
        let message=document.getElementById("Message").value;
        console.log(message);
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

<script src="../../plugins/validation/jquery.validate.min.js"></script>
<script src="../../plugins/validation/jquery.validate-init.js"></script>

<script src="../../plugins/moment/moment.js"></script>
<script src="../../plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
<!-- Clock Plugin JavaScript -->
<script src="../../plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
<!-- Color Picker Plugin JavaScript -->
<script src="../../plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
<script src="../../plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
<script src="../../plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
<!-- Date Picker Plugin JavaScript -->
<script src="../../plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<!-- Date range Plugin JavaScript -->
<script src="../../plugins/timepicker/bootstrap-timepicker.min.js"></script>
<script src="../../plugins/bootstrap-daterangepicker/daterangepicker.js"></script>

<script src="../../js/plugins-init/form-pickers-init.js"></script>
