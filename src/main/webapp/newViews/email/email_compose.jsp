<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <title>发送邮件</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="../../css/style.css" rel="stylesheet">
    <!--bootstrap图标库-->
    <link rel="stylesheet" href="../../css/bootstrap-icons.css">
    <script src="../../js/jquery-3.6.0.js"></script>
</head>
<body>
<%--TODO--%>
<input id="Message" type="hidden" value="${Message}">
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="email-left-box"><a href="${pageContext.request.contextPath}/file/compose" class="btn btn-primary btn-block">写邮件</a>
                        <div class="mail-list mt-4">
                            <a href="${pageContext.request.contextPath}/file/main" class="list-group-item border-0 text-primary p-r-0">
                                <i class="fa fa-inbox font-18 align-middle mr-2"></i> <b>收件箱</b>
                                <c:if test="${countFileNoRead>0}">
                                    <span class="badge badge-primary badge-sm float-right m-t-5">${countFileNoRead}</span>
                                </c:if>
                            </a>
                            <a href="${pageContext.request.contextPath}/file/fileListTo" class="list-group-item border-0 text-primary p-r-0">
                                <i class="fa fa-paper-plane font-18 align-middle mr-2"></i>已发送
                            </a>
                        </div>
                    </div>
                    <div class="email-right-box">
                        <div class="compose-content mt-5">
                            <form action="${pageContext.request.contextPath}/file/add" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <%--<input type="text" class="form-control bg-transparent" placeholder=" 发送给谁？" name="fileToName">--%>
                                    <select class="form-control" id="val-sex" name="fileToName">
                                        <option value="">发送给谁？</option>
                                        <c:forEach items="${employeeList}" var="Employee">
                                            <option value="${Employee.employeeName}">${Employee.employeeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control bg-transparent" placeholder=" 标题" name="fileTitle">
                                </div>
                                <div class="form-group">
                                    <textarea class="textarea_editor form-control bg-light" rows="15" placeholder="输入文本......" name="fileText"></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="fallback">
                                        <input class="l-border-1" name="file" type="file">
                                    </div>
                                </div>
                                <div class="text-left m-t-15">
                                    <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="submit"><i class="fa fa-paper-plane m-r-5"></i> 发送</button>
                                    <button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button"><i class="ti-close m-r-5 f-s-12"></i> 取消</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- #/ container -->
<!--Content body end-->
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
</body>
</html>
