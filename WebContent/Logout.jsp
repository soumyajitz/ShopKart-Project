<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log Out</title>
<link href="login.css" type="text/css" rel="stylesheet" />
</head>
<body>
<%String s3=(String)session.getAttribute("u_name"); %>
<div id="top1">
<ul>
<li>  <a href="Shopkart.jsp">Home </a></li>
</ul>
</div>
<a href="Shopkart.jsp" >
<img src="big1.jpg" height="120" width="400" />
</a>
<div class="one">
<%session.invalidate();%>
Succesfully Logged Out.
<a href="Shopkart.jsp">Go To Homepage</a>
</div>
</body>
</html>