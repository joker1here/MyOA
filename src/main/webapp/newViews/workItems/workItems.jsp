<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
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
<%--TODO--%>
<input id="Message" type="hidden" value="${Message}"/>
<div class="row">
    <c:if test="${employee.userLevel>=3}">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">分配任务</h4>
                    <div class="compose-content mt-5">
                        <form action="#">
                            <div class="form-group">
                                <label>任务名称：</label>
                                <input type="text" class="form-control bg-transparent">
                            </div>
                            <div class="form-group">
                                <label>目前进度：</label>
                                <input type="text" class="form-control bg-transparent">
                            </div>
                            <div class="form-group">
                                <label>最后期限：</label>
                                <input type="text" class="form-control" placeholder="2000-01-01" id="mdate">
                            </div>
                            <div class="form-group">
                                <label>分配给：</label>
                                <div>
                                    <select class="form-control" id="val-sex" name="val-sex">
                                        <option value="">请选择</option>
                                        <c:forEach items="${employeeList}" var="Employee">
                                            <option value="${Employee.employeeId}">${Employee.employeeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="text-left m-t-15">
                        <button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button"> 立即分配</button>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
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
                                            <div class="progress-bar gradient-<fmt:formatNumber value="${Work.workFinish/40+1}" maxFractionDigits="0"/>" style="width: ${Work.workFinish}%;" role="progressbar">
                                                <span class="sr-only">
                                                        <fmt:formatNumber value="${Work.workFinish}" maxFractionDigits="2"/>% Complete
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                    <td><fmt:formatDate value="${Work.workTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                    <td>
                                        <span class="label gradient-1 btn-rounded">
                                            <fmt:formatNumber value="${Work.workFinish}" maxFractionDigits="2"/>%
                                        </span>
                                    </td>
                                    <td>
                                        <span>
                                            <a href="javascript:reportWork(${Work.workId});" data-toggle="tooltip" data-placement="top" title="汇报进度">
                                                <i class="fa fa-pencil color-muted m-r-5"></i>
                                            </a>
                                            <%--<a href="#" data-toggle="tooltip" data-placement="top" title="Close">--%>
                                            <%--    <i class="fa fa-close color-danger"></i>--%>
                                            <%--</a>--%>
                                        </span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${employee.userLevel>=3}">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">您已分配的任务如下：</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped verticle-middle">
                            <thead>
                            <tr>
                                <th scope="col">任务</th>
                                <th scope="col">进度</th>
                                <th scope="col">最后期限</th>
                                <th scope="col">标志</th>
                                <th scope="col">员工</th>
                                <th scope="col">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Air Conditioner</td>
                                <td>
                                    <div class="progress" style="height: 10px">
                                        <div class="progress-bar gradient-1" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                        </div>
                                    </div>
                                </td>
                                <td>Apr 20,2018</td>
                                <td><span class="label gradient-1 btn-rounded">70%</span>
                                </td>
                                <td> </td>
                                <td><span></a><a href="#" data-toggle="tooltip" data-placement="top" title="撤销任务"><i class="fa fa-close color-danger"></i></a></span>
                                </td>
                            </tr>
                            <tr>
                                <td>Textiles</td>
                                <td>
                                    <div class="progress" style="height: 10px">
                                        <div class="progress-bar gradient-2" style="width: 70%;" role="progressbar"><span class="sr-only">70% Complete</span>
                                        </div>
                                    </div>
                                </td>
                                <td>May 27,2018</td>
                                <td><span class="label gradient-2 btn-rounded">70%</span>
                                </td>
                                <td> </td>
                                <td><span></a><a href="#" data-toggle="tooltip" data-placement="top" title="撤销任务"><i class="fa fa-close color-danger"></i></a></span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

</div>
<!--**********************************
Scripts
***********************************-->
<script>
    function reportWork(workId) {
        var str = prompt("请输入0-100表示你的进度");
        if (str==null) return;
        if (str>=0&&str<=100){
            window.location.href='${pageContext.request.contextPath}/work/updateFinish?finish='+str+"&workId="+workId;
        }else alert("输入数据出错！")
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
<script src="../../plugins/common/common.min.js"></script>
<script src="../../js/custom.min.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/gleek.js"></script>
<script src="../../js/styleSwitcher.js"></script>
<script src="../../js/jquery-3.6.0.js"></script>

<script src="../../plugins/tables/js/jquery.dataTables.min.js"></script>
<script src="../../plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

</body>
</html>
