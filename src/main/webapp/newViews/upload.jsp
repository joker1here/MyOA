<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/employee/photo" method="post" enctype="multipart/form-data">
    名称：<input type="text" name="username"><br>
    文件：<input type="file" name="uploadFile"><br>
    <input type="submit" value="上传"><br>
    <a  href="<c:url value='/file/download'/>">下载</a><br/>
</form>
</body>
</html>
