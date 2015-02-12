<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="login.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="one">
<a href="Shopkart.jsp">
|Go To Homepage|
</a>
<a href="Newlogin.jsp">
|Register/Login|
</a>
<%
Context ctx=new InitialContext();
DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
Connection con=ds.getConnection();
String s1=request.getParameter("b1");
if(s1.equalsIgnoreCase("SignUp"))
{
String u_name=request.getParameter("t1");
String u_address=request.getParameter("t2");
String u_password=request.getParameter("t3");
String u_email=request.getParameter("t5");
String u_mobile=request.getParameter("t6");
PreparedStatement ps=con.prepareStatement("insert into user_details(u_id,u_name,u_address,u_password,u_email,u_mobile) values(s1.nextval,?,?,?,?,?)");
ps.setString(1,u_name);
ps.setString(2,u_address);
ps.setString(3,u_password);
ps.setString(4,u_email);
ps.setInt(5,Integer.parseInt(u_mobile));
int i=ps.executeUpdate();
if(i>0)
{
%>
<script type="text/javascript">
alert("You Have Registered Successfully!!!");
</script>
<% 
} 
else
	out.println("Not Inserted");
}
if(s1.equalsIgnoreCase("Login"))
{
PreparedStatement ps=con.prepareStatement("select * from user_details where  u_email=? and u_password=?");
ps.setString(1,request.getParameter("T1"));
ps.setString(2,request.getParameter("T2"));
ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		String ab=rs.getString(6);
		session.setAttribute("u_name",ab);
		session.setAttribute("u_email",rs.getString(2));
		session.setAttribute("u_address",rs.getString(3));
		session.setAttribute("u_mobile",rs.getString(4));
		response.sendRedirect("Shopkart.jsp");
	}
	else
	{
		%>
		<script>
		alert("Invalid Entry-Please Enter Proper Username OR Password to access Shopping.");
		</script>
		<% 
		//session.setAttribute("u_name","Invalid Entry");
		//response.sendRedirect("Newlogin.jsp");
	}
}
%>
</div>
</body>
</html>