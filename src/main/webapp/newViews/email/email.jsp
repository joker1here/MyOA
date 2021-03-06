<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
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
                        <div role="toolbar" class="toolbar">
                            <div class="btn-group">
                                <button aria-expanded="false" data-toggle="dropdown" class="btn btn-dark dropdown-toggle" type="button">操作 <span class="caret m-l-5"></span>
                                </button>
                                <c:if test="${fileOption==1}">
                                    <div class="dropdown-menu">
                                        <a href="javascript: NoRead(0);" class="dropdown-item">标为未读</a>
                                        <a href="javascript: DeleteEmail(0);" class="dropdown-item">删除</a>
                                    </div>
                                </c:if>
                                <c:if test="${fileOption==0}">
                                    <div class="dropdown-menu">
                                        <a href="javascript: DeleteEmail(0);" class="dropdown-item">撤回</a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="email-list m-t-15">
                            <%--TODO--%>
                            <c:forEach items="${fileList}" var="File">
                            <div class="message">
                                <a href="${pageContext.request.contextPath}/file/read?fileId=${File.fileId}&option=${fileOption}">
                                    <div class="col-mail col-mail-1">
                                        <div class="email-checkbox">
                                            <input type="checkbox" id="${File.fileId}" name="checkbox" value="${File.fileId}">
                                            <label class="toggle" for="${File.fileId}"></label>
                                        </div>
                                        <c:if test="${File.fileRead==0}">
                                            <i class="fa fa-envelope" aria-hidden="true"></i>
                                        </c:if>

                                    </div>
                                    <div class="col-mail col-mail-2">
                                        <div class="subject">${File.fileTitle}</div>
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
                                <div class="text-left">1 - 20 of ${fileList.size()}</div>
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
<script>
    function NoRead() {
        var array = $("input[name=checkbox]:checked");
        if(array.length==0){
            window.alert("请选择记录");
        }else{
            var str = "";
            for(var i=0;i<array.length;i++){
                str += $(array[i]).val();
                if(i<array.length-1){
                    str += ",";
                }
            }
            window.location.href='${pageContext.request.contextPath}/file/noRead?check='+str;
        }
    }
    function DeleteEmail() {
        var array = $("input[name=checkbox]:checked");
        if(array.length==0){
            window.alert("请选择记录");
        }else{
            var c = confirm("确认要删除吗？");
            if (c==true){
                var str = "";
                for(var i=0;i<array.length;i++){
                    str += $(array[i]).val();
                    if(i<array.length-1){
                        str += ",";
                    }
                }
                window.location.href='${pageContext.request.contextPath}/file/deleteEmail?check='+str;
            }
        }
    }

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
<!--Scripts-->
<script src="../../plugins/common/common.min.js"></script>
<script src="../../js/custom.min.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/gleek.js"></script>
<script src="../../js/styleSwitcher.js"></script>

</body>
</html>
