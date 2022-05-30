<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>活动公告</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="../../css/style.css" rel="stylesheet">
    <!-bootstrap图标库-->
    <link rel="stylesheet" href="../../css/bootstrap-icons.css">
</head>
<body>

<div class="row">
    <div class="col-lg-6">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">通知</h4>
                <p class="text-muted"><code></code>
                </p>
                <div id="accordion-one" class="accordion">
                    <%--TODO--%>
                    <c:forEach items="${noticeList}" var="Notice">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0" data-toggle="collapse" data-target="#collapse${Notice.noticeId}" aria-expanded="true" aria-controls="collapseOne">
                                    <i class="fa" aria-hidden="true"></i> 标题：${Notice.noticeName}
                                    <c:if test="${employee.userLevel>=3}">
                                        <a href='${pageContext.request.contextPath}/notice/delete?noticeId=${Notice.noticeId}' class="ti-trash"></a>
                                    </c:if>
                                </h5>
                            </div>
                            <div id="collapse${Notice.noticeId}" class="collapse show" data-parent="#accordion-one">
                                <div class="card-body">内容：${Notice.noticeInfo}</div>
                                <div class="card-footer"><fmt:formatDate value="${Notice.noticeTime}" pattern="yyyy-MM-dd HH:mm"/></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${employee.userLevel>=3}">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">发布通知</h4>
                    <div class="compose-content mt-5">
                        <form action="/notice/add" method="post">
                            <div class="form-group">
                                <input type="text" name="title" class="form-control bg-transparent" placeholder=" 标题">
                            </div>
                            <div class="form-group">
                                <textarea name="text" class="textarea_editor form-control bg-light" rows="15" placeholder="输入文本......"></textarea>
                            </div>
                            <div class="text-left m-t-15">
                                <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="submit"><i class="fa fa-paper-plane m-r-5"></i> 发布</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </c:if>
</div>
<!-- #/ container -->
<!--    Content body end-->

<!--Scripts-->
<script src="../../plugins/common/common.min.js"></script>
<script src="../../js/custom.min.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/gleek.js"></script>
<script src="../../js/styleSwitcher.js"></script>

</body>
</html>
