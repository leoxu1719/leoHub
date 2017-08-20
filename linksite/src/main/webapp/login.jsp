<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%
request.setAttribute("ctx",request.getContextPath());
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SiteDem Login</title>

<link rel="icon" type="image/png" href="images/favicon.png" />
<link rel="stylesheet" type="text/css" href="css/reset.css" >
<link rel="stylesheet" type="text/css" href="css/style.css" >
<link rel="stylesheet" type="text/css" href="css/superfish.css" >
<link rel="stylesheet" type="text/css" href="css/colorbox.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>

</head>
<body>


	<div id="loginblock" >
		<div class="login-icon" ><img  src="images/logo.png" alt="Logo" /></div>
		<span class="login-title">Sign in to SiteDem</span>
		<div class="login-box">
			<form id="form1" method="post" action="${ctx}/user/login.do">
					<div>					
						<label class="login-label">Username or email address:</label>
						<input   id="loginName" name="loginName" type="text"  class="login-field"/>
						<div class="login-label">
							<label >Password: </label>
							<a class="login-a">Forget password ?</a>
						</div>
						<input id="passWord" name="passWord" type="password"  class="login-psw-field" />
						<a class="login-btn" onclick="$(form1).submit();">Login</a>
					</div>
			</form>
		</div>
		
		<div class="login-box">
			<div class="login-label">
				<label >New to SiteDem ?</label>
				<a class="login-a">Create an account</a>
			</div>		
		</div>
	</div>

</body>
</html>