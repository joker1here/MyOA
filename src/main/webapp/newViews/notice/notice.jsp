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
