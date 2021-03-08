
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>登陆</h1>

<form method="post" action="/login">
    <div>
        用户名：<input type="text" name="username" required="required" autocomplete="off">
    </div>
    <div>
        密码：<input type="password" name="password" required="required">
    </div>
    <div>
        <input type="text" autocomplete="off" class="form-control" name="verifyCode" required="required" placeholder="验证码">
        <img src="getVerifyCode" title="看不清，请点我" onclick="refresh(this)" onmouseover="mouseover(this)" />
    </div>
    <div>
        <button type="submit">立即登陆</button>
        <label><input type="checkbox" name="remember-me"/>自动登录</label>
    </div>
</form>
<script>
    function refresh(obj) { obj.src = "getVerifyCode?" + Math.random(); }
    function mouseover(obj) { obj.style.cursor = "pointer"; }
</script>

</body>
</html>
