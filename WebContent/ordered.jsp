<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="mob.*,javax.sql.*,java.sql.*,javax.naming.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Confirmation</title>
<link href="ordered.css" type="text/css" rel="stylesheet" />
</head>
<body>
<%
String ss=(String)session.getAttribute("i_brand");
Context ctx=new InitialContext();
DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
Connection con=ds.getConnection();
Connection con1=ds.getConnection();
int min=0,max=1000;
int randomNum = min + (int)(Math.random()*max);
int randomNum1 = min + (int)(Math.random()*max);
String s1=(String)session.getAttribute("u_name");
String s7=(String)session.getAttribute("u_email");
//String s2=s1.substring(0,4); 
String s3=randomNum1+"xyz"+randomNum;
session.setAttribute("order",String.valueOf(s3));
String s4=request.getParameter("pay");
ArrayList<Phone2> al=(ArrayList)session.getAttribute("getcart");
for(int i=0;i<al.size();i++)
{
	Phone2 ph1=al.get(i);
	PreparedStatement ps;
	if(s4.equalsIgnoreCase("cheque")||s4.equalsIgnoreCase("card"))
	{
		String s5=request.getParameter("t10");
 ps=con.prepareStatement("insert into item_order values(?,?,sysdate,?,?,?)");
ps.setString(1,s3);
ps.setString(2,ph1.getSet_no());
ps.setString(3,s5);
ps.setString(4,s4);
ps.setString(5,s7);
	}
	else
	{
		ps=con.prepareStatement("insert into item_order(o_number,set_no,o_date,o_remarks,u_email) values(?,?,sysdate,?,?)");
		
		ps.setString(1,s3);
		ps.setString(2,ph1.getSet_no());
		ps.setString(3,s4);
		ps.setString(4,s7);	
	}
	int k=ps.executeUpdate();
}
%>
<div class="one">
<h3>Your Order has been Confirmed.</h3>
<h1><a href="Shopkart.jsp">Continue Shopping</a></h1>
<center>
<table>
<tr>
<th>Name:</th>
<td><%=s1 %></td>
</tr>
<tr>
<th>Address:</th>
<td><%=(String)session.getAttribute("u_address")%></td>
</tr>
<tr>
<th>Phone:</th>
<td><%=(String)session.getAttribute("u_mobile") %></td>
</tr>
<th>Order Number:</th>
<td><%=s3%></td>
</tr>
</table>
<%
con.close();
PreparedStatement ps1=con1.prepareStatement("select i.set_no,i.i_price,i.set_name from  item_order o,item_details i where o.o_number=? and i.set_no=o.set_no");
ps1.setString(1,s3);
ResultSet rs=ps1.executeQuery();
double t=0,d=0;
%>
<table border=1>
<tr>
<th>Brand Name</th>
<th>Item Name</th>
<th>Price</th></tr>
<%while (rs.next())
{
	d=rs.getDouble(2);
	t+=d;
	out.println("<tr><td> "+rs.getString(3)+"</td><td>"+rs.getString(1)+"</td><td>"+d+"</td></tr>");	
}
%>
<tr><td colspan=2><hr /></td></tr><tr><th>Total</th><td><%=t %></td></tr>
</table>
<br />
<a href="excel.jsp?pay=<%=s4%>">Print Report in Excel Format</a>
<br />
<a href="Logout.jsp">Logout</a>
</center>
</div>
<div id="top1">
</div>
<a href="Shopkart.jsp" >
<img src="big1.jpg" height="120" width="400" />
</a>

</body>
</html>