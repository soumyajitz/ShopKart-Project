<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Here</title>
<link href="login.css" type="text/css" rel="stylesheet" />
<script>
if(document.form1.T1.value=" ")
	{
	alert("Enter a Proper Username");
	}
</script>
</head>
<body>
<%String s2=(String)session.getAttribute("u_name"); %>
<form method="post" action="Signup.jsp" name="form1">
<div id="top1">
<ul>
<li>  <a href="Shopkart.jsp">Home </a></li>
<%if(s2==null)
	{
	%>
<li> <a href="Newlogin.jsp">| Login </a></li>
<li> <a href="Newlogin.jsp">| Sign Up</a> </li><%} %>
<%if(s2!=null)
	{
	%>
<li>  <a href="Logout.jsp">| Logout </a></li><%} %>
</ul>
<h3>You Have to either Register or Login to Buy Mobiles!!!</h3>
</div>
<a href="Shopkart.jsp" >
<img src="big1.jpg" height="120" width="400" />
</a>
<div class="one">
<fieldset>
<legend>Login</legend>
E-MAIL <input type="text" name="T1" placeholder="xxxx@yyy.com" /><br /><br />
PASSWORD <input type="password" name="T2" placeholder="**********"><br /><br />
<input type="submit" value="Login"  name="b1"/>
</fieldset>
<br />
<fieldset>
<legend>Sign Up</legend>

	NAME* <input type="text" name="t1" placeholder="Enter Your Name"><br><br>
	ADDRESS*<input type="text" name="t2" placeholder="Enter Your Address"><br><br>
	PASSWORD*<input type="password" name="t3" placeholder="Enter Password" /><br /><br />
<!--  CONFIRM PASSWORD<input type="text" name="t4"  /><br /><br />-->
E-MAIL*<input type="email" name="t5"  placeholder="xxx@yyy.com"/><br /><br />
PHONE* <input type="text" name="t6" placeholder="+91-xxxxx-yyyyy" /><br /><br />
	
	<input type="submit" name="b1" value="SignUp">
	</fieldset>
</div>
</form>


</body>
</html>