<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <div class="toolbar" role="toolbar">
                            <div class="btn-group m-b-20">
                                <button type="button" class="btn btn-light"><i class="fa fa-archive"></i>
                                </button>
                                <button type="button" class="btn btn-light"><i class="fa fa-exclamation-circle"></i>
                                </button>
                                <button type="button" class="btn btn-light"><i class="fa fa-trash"></i>
                                </button>
                            </div>
                            <div class="btn-group m-b-20">
                                <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown"><i class="fa fa-folder"></i>  <b class="caret m-l-5"></b>
                                </button>
                                <div class="dropdown-menu"><a class="dropdown-item" href="javascript: void(0);">Social</a>  <a class="dropdown-item" href="javascript: void(0);">Promotions</a>  <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                                    <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                </div>
                            </div>
                            <div class="btn-group m-b-20">
                                <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown"><i class="fa fa-tag"></i>  <b class="caret m-l-5"></b>
                                </button>
                                <div class="dropdown-menu"><a class="dropdown-item" href="javascript: void(0);">Updates</a>  <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                                    <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                </div>
                            </div>
                            <div class="btn-group m-b-20">
                                <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">More <span class="caret m-l-5"></span>
                                </button>
                                <div class="dropdown-menu"><a class="dropdown-item" href="javascript: void(0);">Mark as Unread</a>  <a class="dropdown-item" href="javascript: void(0);">Add to Tasks</a>  <a class="dropdown-item"
                                                                                                                                                                                                              href="javascript: void(0);">Add Star</a>  <a class="dropdown-item" href="javascript: void(0);">Mute</a>
                                </div>
                            </div>
                        </div>
                        <div class="read-content">
                            <div class="media pt-5">
                                <img class="mr-3 rounded-circle" src="../../images/avatar/1.jpg">
                                <div class="media-body">
                                    <h5 class="m-b-3">${file.employeeTo.employeeName}</h5>
                                    <p class="m-b-2"><fmt:formatDate value="${file.fileTime}" pattern="yyyy-MM-dd"/></p>
                                </div>

                            </div>
                            <hr>
                            <div class="media mb-4 mt-1">
                                <div class="media-body"><span class="float-right"><fmt:formatDate value="${file.fileTime}" pattern="HH:mm"/></span>
                                    <h4 class="m-0 text-primary">${file.fileTitle}</h4><small class="text-muted">To:Me,invernessmckenzie@example.com</small>
                                </div>
                            </div>
                            <h5 class="m-b-15">Hi,${file.toEmployee.employeeName},</h5>
                            <%--<p><strong>Ingredia Nutrisha,</strong> A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture</p>--%>
                            <p>${file.fileText}
                            </p>
                            <%--<p>Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.--%>
                            <%--    Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero,--%>
                            <%--    sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar,</p>--%>
                            <h5 class="m-b-5 p-t-15">${file.employeeTo.employeeName}</h5>
                            <%--<p>Mr Smith</p>--%>
                            <hr>
                            <h6 class="p-t-15"><i class="fa fa-download mb-2"></i> Attachments <span>(3)</span></h6>
                            <div class="row m-b-30">
                                <div class="col-auto"><a href="${pageContext.request.contextPath}/file/download?fileId=${file.fileId}" class="text-muted">${file.fileName}.${file.fileForm}</a>
                                </div>
                                <%--<div class="col-auto"><a href="#" class="text-muted">My-File.docx</a>--%>
                                <%--</div>--%>
                                <%--<div class="col-auto"><a href="#" class="text-muted">My-Resume.pdf</a>--%>
                                <%--</div>--%>
                            </div>
                            <hr>
                            <div class="form-group p-t-15">
                                <textarea class="w-100 p-20 l-border-1" name="" id="" cols="30" rows="5" placeholder="It's really an amazing.I want to know more about it..!"></textarea>
                            </div>
                        </div>
                        <div class="text-right">
                            <button class="btn btn-primaryw-md m-b-30" type="button">Send</button>
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
