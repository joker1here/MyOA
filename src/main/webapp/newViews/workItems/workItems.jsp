<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>工作事项</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="../../css/style.css" rel="stylesheet">
    <!-- bootstrap图标库-->
    <link rel="stylesheet" href="../../css/bootstrap-icons.css">
    <!-- Custom Stylesheet -->
    <link href="../../plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body>
<div class="row">
    <div class="col-lg-6">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">您当前的任务如下：</h4>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped verticle-middle">
                        <thead>
                        <tr>
                            <th scope="col">任务</th>
                            <th scope="col">进度</th>
                            <th scope="col">最后期限</th>
                            <th scope="col">标志</th>
                            <th scope="col">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <%--TODO--%>
                            <c:forEach items="${workList}" var="Work">
                                <tr>
                                    <td>${Work.workText}</td>
                                    <td>
                                        <div class="progress" style="height: 10px">
                                            <div class="progress-bar gradient-1" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><fmt:formatDate value="${Work.workTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                    <td><span class="label gradient-1 btn-rounded">70%</span>
                                    </td>
                                    <td><span><a href="#" data-toggle="tooltip" data-placement="top" title="汇报进度"><i class="fa fa-pencil color-muted m-r-5"></i> </a><a href="#" data-toggle="tooltip" data-placement="top" title="Close"><i class="fa fa-close color-danger"></i></a></span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--**********************************
Scripts
***********************************-->
<script src="../../plugins/common/common.min.js"></script>
<script src="../../js/custom.min.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/gleek.js"></script>
<script src="../../js/styleSwitcher.js"></script>

<script src="../../plugins/tables/js/jquery.dataTables.min.js"></script>
<script src="../../plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
</body>
</html>