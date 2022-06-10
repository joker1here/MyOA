<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>职位管理</title>
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
                    <h4 class="card-title">职位管理</h4>
                    <br/>
                    <button class="btn btn-primary" onclick="add()">添加职位</button>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered zero-configuration">
                            <thead>
                            <tr>
                                <th>职位名称</th>
                                <th>职位描述</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${jobList}" var="Job">
                                <c:if test="${Job.jobId>0}">
                                <tr>
                                    <td align="center" valign="center">${Job.jobName}</td>
                                    <td align="center" valign="center">${Job.jobIntroduce}</td>
                                    <td align="center" valign="center">
                                        <button name="eitBtn" class="btn btn-primary" data-toggle="modal" data-target="#basicModal" onclick="change(${Job.jobId})">修改</button>
                                        <button name="delBtn" class="btn  btn-danger" onclick="del(${Job.jobId})">删除</button>
                                    </td>
                                </tr>
                                </c:if>
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
    function change(Id) {
        window.location.href = '${pageContext.request.contextPath}/job/change?Id='+Id;
    }
    function del(Id) {
        var c = confirm("确认删除该职位吗？");
        if(c==true){
            window.location.href = '${pageContext.request.contextPath}/job/delete?Id='+Id;
        }
    }
    function add() {
        window.location.href = '${pageContext.request.contextPath}/job/add';
    }
    function Message() {
        let message = document.getElementById("Message").value;
        //let message=$("#Message").val();
        // console.log("success");
        if(message !=  null && message.trim() !== "" &&message!=="null"){
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
