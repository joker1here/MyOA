<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>阅读邮件</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="../../css/style.css" rel="stylesheet">
    <%--bootstrap图标库--%>
    <link rel="stylesheet" href="../../css/bootstrap-icons.css">
    <script src="../../js/jquery-3.6.0.js"></script>
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
</head>
<body>
<%--TODO--%>
<input id="Message" type="hidden" value="${Message}">
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="email-left-box">
                        <a href="${pageContext.request.contextPath}/file/compose" class="btn btn-primary btn-block">写邮件</a>
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

                        <div class="read-content">
                            <div class="media pt-5">
                                <div class="media-body">
                                    <h5 class="m-b-3">${file.employeeTo.employeeName}</h5>
                                    <p class="m-b-2"><fmt:formatDate value="${file.fileTime}" pattern="yyyy-MM-dd"/></p>
                                </div>

                            </div>
                            <hr>
                            <div class="media mb-4 mt-1">
                                <div class="media-body"><span class="float-right"><fmt:formatDate value="${file.fileTime}" pattern="HH:mm"/></span>
                                    <h4 class="m-0 text-primary">${file.fileTitle}</h4>
                                </div>
                            </div>
                            <p>${file.fileText}
                            </p>
                            <hr>
                            <h6 class="p-t-15"><i class="fa fa-download mb-2"></i> 附件 </h6>
                            <div class="row m-b-30">
                                <div class="col-auto"><a href="${pageContext.request.contextPath}/file/download?fileId=${file.fileId}" class="text-muted">${file.fileName}.${file.fileForm}</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- #/ container -->
<!--Content body end-->

<!--Scripts-->
<script src="../../plugins/common/common.min.js"></script>
<script src="../../js/custom.min.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/gleek.js"></script>
<script src="../../js/styleSwitcher.js"></script>
</body>
</html>
