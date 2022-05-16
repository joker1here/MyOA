<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">

  <title>滑动切换的注册登录界面</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
</head>
<body>
<div class="container">
  <div class="form-box">
    <!-- 注册 -->
    <div class="register-box hidden">
      <h1>register</h1>
      <input id="username2" type="text" name="username2" placeholder="用户名">
      <input id="userpwd2" type="password" name="userpwd2" placeholder="密码">
      <input id="userpwd3" type="password" name="userpwd3" placeholder="确认密码"><br>
      <span id="msg1" style="font-size: 12px; color: red; letter-spacing: 2px;"></span>
      <button type="button" id="registerbtn">注册</button>
    </div>
    <!-- 登录 -->
    <div class="login-box">
      <h1>login</h1>
      <input id="username1" type="text" name="username1" placeholder="用户名">
      <input id="userpwd1" type="password" name="userpwd1" placeholder="密码"><br>
      <span id="msg" style="font-size: 12px; color: red; letter-spacing: 2px;"></span>
      <button type="button" id="loginbtn" >登录</button>
    </div>
  </div>
  <div class="con-box left">
    <h2>欢迎来到<span>网上办公系统</span></h2>
    <p>创建您的专属<span>工作</span>编号</p>
    <img src="${pageContext.request.contextPath}/images/1.png" alt="">
    <p>已有账号！</p>
    <button id="login">去登录</button>
  </div>
  <div class="con-box right">
    <h2>欢迎来到<span>网络办公系统</span></h2>
    <p>继续完成您的<span>工作</span>任务</p>
    <img src="${pageContext.request.contextPath}/images/2.png" alt="">
    <p>没有账号？</p>
    <button id="register">去注册</button>
  </div>
</div>

<script>
  // 要操作到的元素
  let tologin=document.getElementById('login');
  let toregister=document.getElementById('register');
  let login=document.getElementById('loginbtn');
  let register=document.getElementById('registerbtn');
  let form_box=document.getElementsByClassName('form-box')[0];
  let register_box=document.getElementsByClassName('register-box')[0];
  let login_box=document.getElementsByClassName('login-box')[0];

  //注册按钮事件
  register.addEventListener('click',()=>{
    var une2=document.getElementById("username2").value;
    var upd2=document.getElementById("userpwd2").value;
    var upd3=document.getElementById("userpwd3").value;

    var usernameRegExp = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;//用户名正则表达式
    //判断une2的value值是否为空
    //清除前后空白
    var ue2 = une2.trim();
    une2 = ue2;
    var usernameRetVal2 = usernameRegExp.test(ue2);
    //une1不为空或全为空格开始验证
    if(!isEmpty(une2)){
      if(!usernameRetVal2){
        //此处测试正确
        //获取用户名后文本对象
        $("#msg1").html("用户名格式不正确");
        return;
      }else {
        //此处测试正确,继续
      }
    }else{
      $("#msg1").html("用户名不能为空");
      return;
    }

    var passwordRegExp=/^[a-zA-Z]\w{5,17}$/;//密码正则表达式
    //判断passwordRegExp的value值是否为空
    //去除前后空白
    var pd2 = upd2.trim();
    upd2 = pd2;
    var passwordRetVal2 = passwordRegExp.test(pd2);
    //upd2不为空或全为空格开始验证
    if(!isEmpty(upd2)){
      if(!passwordRetVal2){
        //此处测试正确
        //获取用户名后文本对象
        $("#msg1").html("密码格式错误");
        return;
      }else {
        //此处测试正确,继续
      }
    }else{
      $("#msg1").html("密码不能为空");
      return;
    }

    //去除前后空白
    var pd3=upd3.trim();
    upd3 = pd3;
    //判断重复密码pd3内容是否为空，不为空则开始验证
    if(!isEmpty(upd3)){
      //重复密码内容upd3不为空，开始验证
      //判断密码upd2是否为空，不为空则开始验证
      if(!isEmpty(upd2) && upd2 == upd3)/*{
                $("#msg1").html("密码不能为空");
                return;
            }else {
                //判断密码upd2和重复密码upd3是否相等
                if(upd2 == upd3)*/{
        //此处测试正确,继续
      }else{
        $("#msg1").html("密码并不相同");
        return;
      }
      /*}*/
    }else{
      $("#msg1").html("确认密码不能为空");
      return;
    }

    // window.alert("用户名：" + une2 + "\n密码：" + upd2 + "\n确认密码：" + upd3);
    employeeRegister(une2,upd2);
  })

  //登录按钮事件
  //用户名以字母开头，允许5-16之间，只能包含字母、数字、下划线组成
  //密码以字母开头，长度在6~18之间，只能包含字母、数字和下划线组成
  login.addEventListener('click',()=>{
    var une1=document.getElementById("username1").value;
    var upd1=document.getElementById("userpwd1").value;

    var usernameRegExp = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;//用户名正则表达式
    //判断username的value值是否为空
    //清除前后空白
    var ue1 = une1.trim();
    une1 = ue1;
    var usernameRetVal1 = usernameRegExp.test(ue1);
    //une1不为空或全为空格开始验证
    if(!isEmpty(une1)){
      if(!usernameRetVal1){
        //此处测试正确
        //获取用户名后文本对象
        $("#msg").html("用户名格式不正确");
        return;
      }else {
        //此处测试正确,继续
      }
    }else{
      $("#msg").html("用户名不能为空");
      return;
    }

    var passwordRegExp=/^[a-zA-Z]\w{5,17}$/;//密码正则表达式
    //判断passwordRegExp的value值是否为空
    //去除前后空白
    var pd1=upd1.trim();
    upd1 = pd1;
    var passwordRetVal1=passwordRegExp.test(pd1);
    //upd1不为空或全为空格开始验证
    if(!isEmpty(upd1)){
      if(!passwordRetVal1){
        //此处测试正确
        //获取用户名后文本对象
        $("#msg").html("密码格式错误");
        return;
      }else {
        //此处测试正确,继续
      }
    }else{
      $("#msg").html("密码不能为空");
      return;
    }
    // window.alert("用户名：" + une1 + "\n密码：" + upd1);
    employeeLogin(une1,upd1);
  });
  //TODO
  function employeeRegister(username,password) {
    // alert("进入注册");
    window.location.href='/employee/register?username='+username+'&password='+password;
  }
  //TODO
  function employeeLogin(username,password) {
    // alert("进入登陆");
    window.location.href='/employee/login?username='+username+'&password='+password;
    // $.ajax({
    //   url: "/MMS_war_exploded/employee/login",
    //   async: false,//这一步是非常重要的，作用是设置为同步执行
    //   type: "GET",
    //   data: { "username1": "zhangsan","userpwd1": "123" },
    //   dataType: "json",
    //   success: function (data) {
    //     alert("success");
    //   }
    // });

    // $.post("/employee/login", {"username1": "zhangsan","userpwd1": "123"}, function (data) {
    //   alert("success");
    // });
  }

  /**
   * 判断字符串为空
   *      如果为空，返回true
   *      如果不为空，返回false
   * @param str
   * @returns {boolean}
   */
  function isEmpty(str){
    if (str ==  null || str.trim() == "") {
      return true;
    }
    return false;
  }

  // 去注册按钮点击事件
  toregister.addEventListener('click',()=>{
    form_box.style.transform='translateX(80%)';
    login_box.classList.add('hidden');
    register_box.classList.remove('hidden');
    clear_content();
  })

  // 去登录按钮点击事件
  tologin.addEventListener('click',()=>{
    form_box.style.transform='translateX(0%)';
    register_box.classList.add('hidden');
    login_box.classList.remove('hidden');
    clear_content();
  })

  //清空输入框内容
  function clear_content() {
    document.getElementById("msg").innerText="";
    document.getElementById("msg1").innerText="";
    document.getElementById("username1").value="";
    document.getElementById("username2").value="";
    document.getElementById("userpwd1").value="";
    document.getElementById("userpwd2").value="";
    document.getElementById("userpwd3").value="";
  }
</script>
</body>
</html>
