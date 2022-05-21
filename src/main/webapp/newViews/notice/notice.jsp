<%--
  Created by IntelliJ IDEA.
  User: 32692
  Date: 2022/5/21
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
                <h4 class="card-title">活动</h4>
                <p class="text-muted"><code></code>
                </p>
                <div id="accordion-one" class="accordion">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"><i class="fa" aria-hidden="true"></i> Accordion Header One</h5>
                        </div>
                        <div id="collapseOne" class="collapse show" data-parent="#accordion-one">
                            <div class="card-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><i class="fa" aria-hidden="true"></i> Accordion Header Two</h5>
                        </div>
                        <div id="collapseTwo" class="collapse" data-parent="#accordion-one">
                            <div class="card-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><i class="fa" aria-hidden="true"></i> Accordion Header Tne</h5>
                        </div>
                        <div id="collapseThree" class="collapse" data-parent="#accordion-one">
                            <div class="card-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">通知</h4>
                <p class="text-muted"><code></code>
                </p>
                <div id="accordion-two" class="accordion">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1"><i class="fa" aria-hidden="true"></i> Accordion Header One</h5>
                        </div>
                        <div id="collapseOne1" class="collapse show" data-parent="#accordion-two">
                            <div class="card-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2"><i class="fa" aria-hidden="true"></i> Accordion Header Two</h5>
                        </div>
                        <div id="collapseTwo2" class="collapse" data-parent="#accordion-two">
                            <div class="card-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3"><i class="fa" aria-hidden="true"></i> Accordion Header Tne</h5>
                        </div>
                        <div id="collapseThree3" class="collapse" data-parent="#accordion-two">
                            <div class="card-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.</div>
                        </div>
                    </div>
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
