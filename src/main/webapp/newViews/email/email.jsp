<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>邮箱</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="../../css/style.css" rel="stylesheet">
    <!--<!-bootstrap图标库&ndash;&gt;-->
    <link rel="stylesheet" href="../../css/bootstrap-icons.css">
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="email-left-box">
                        <a href="${pageContext.request.contextPath}/file/compose" class="btn btn-primary btn-block">写邮件</a>
                        <div class="mail-list mt-4"><a href="${pageContext.request.contextPath}/file/main" class="list-group-item border-0 text-primary p-r-0"><i class="fa fa-inbox font-18 align-middle mr-2"></i> <b>收件箱</b> <span class="badge badge-primary badge-sm float-right m-t-5">198</span> </a>
                            <a href="#" class="list-group-item border-0 p-r-0"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i>已发送</a>
                            <%--<a href="#" class="list-group-item border-0 p-r-0"><i class="fa fa-star-o font-18 align-middle mr-2"></i>重要 <span class="badge badge-danger badge-sm float-right m-t-5">47</span> </a>--%>
                            <%--<a href="#" class="list-group-item border-0 p-r-0"><i class="fa fa-trash font-18 align-middle mr-2"></i>回收站</a>--%>
                        </div>
                        <%--<h5 class="mt-5 m-b-10">邮件类别</h5>--%>
                        <%--<div class="list-group mail-list"><a href="#" class="list-group-item border-0">--%>
                        <%--    <span class="fa fa-briefcase f-s-14 mr-2"></span>工作</a>--%>
                        <%--    <a href="#" class="list-group-item border-0"><span class="fa fa-sellsy f-s-14 mr-2"></span>私人</a>--%>
                        <%--    <a href="#" class="list-group-item border-0"><span class="fa fa-tags f-s-14 mr-2"></span>社交</a>--%>
                        <%--    <a href="#" class="list-group-item border-0"><span class="fa fa-ticket f-s-14 mr-2"></span>未分类</a>--%>
                        <%--</div>--%>
                    </div>
                    <div class="email-right-box">
                        <div role="toolbar" class="toolbar">
                            <div class="btn-group">
                                <button aria-expanded="false" data-toggle="dropdown" class="btn btn-dark dropdown-toggle" type="button">操作 <span class="caret m-l-5"></span>
                                </button>
                                <div class="dropdown-menu">
                                    <a href="javascript: void(0);" class="dropdown-item">标为未读</a>
                                    <%--<a href="javascript: void(0);"class="dropdown-item">添加为重要</a>--%>
                                    <a href="javascript: void(0);" class="dropdown-item">删除</a>
                                </div>
                            </div>
                        </div>
                        <div class="email-list m-t-15">
                            <%--TODO--%>
                            <c:forEach items="${fileList}" var="File">
                            <div class="message">
                                <a href="${pageContext.request.contextPath}/file/read">
                                    <div class="col-mail col-mail-1">
                                        <div class="email-checkbox">
                                            <input type="checkbox" id="chk${File.fileId}">
                                            <label class="toggle" for="chk${File.fileId}"></label>
                                        </div><span class="star-toggle ti-star"></span>
                                    </div>
                                    <div class="col-mail col-mail-2">
                                        <div class="subject">${File.fileText}</div>
                                        <%--<div class="date">${File.fileTime}</div>--%>
                                        <div class="date">
                                            <fmt:formatDate value="${File.fileTime}" pattern="yyyy-MM-dd HH:mm"/>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            </c:forEach>

                        </div>
                        <!-- panel -->
                        <div class="row">
                            <div class="col-7">
                                <div class="text-left">1 - 20 of 568</div>
                            </div>
                            <div class="col-5">
                                <div class="btn-group float-right">
                                    <button class="btn btn-gradient" type="button"><i class="fa fa-angle-left"></i>
                                    </button>
                                    <button class="btn btn-dark" type="button"><i class="fa fa-angle-right"></i>
                                    </button>
                                </div>
                            </div>
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
