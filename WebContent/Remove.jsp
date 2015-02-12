<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="mob.*,javax.sql.*,java.sql.*,javax.naming.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String s=request.getParameter("icode");
ArrayList<Phone2> ph=(ArrayList)session.getAttribute("getcart"); 
for(int i=0;i<ph.size();i++)
{
	Phone2 p=ph.get(i);
	if(p.getSet_no().equals(s))
	{
		ph.remove(i);
	}
}
session.setAttribute("getcart",ph);
response.sendRedirect("Confirm.jsp");
%>
</body>
</html>