<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="mob.*,javax.sql.*,java.sql.*,javax.naming.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Confirmation</title>
<script language="javascript">
function abc(v)
	{
	var x=v.value;
	if(x=="cheque")
		{
		document.getElementById("pay1").innerHTML="Enter Your CHQ/DD No:<input type=text name=t10 />";
		document.getElementById("pay2").innerHTML=" ";
		}
	else if(x=="card")
		{
		document.getElementById("pay1").innerHTML=" ";
		document.getElementById("pay2").innerHTML="Enter Your CHQ/DD No:<input type=text name=t10 />";
		}
	else if(x=="paycash")
	{
	document.getElementById("pay1").innerHTML=" ";
	document.getElementById("pay2").innerHTML=" ";
	}
	}
</script>
<link href="Confirm.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form action="ordered.jsp" method="get">
<div id="top1">
</div>
<a href="Shopkart.jsp" >
<img src="big1.jpg" height="120" width="400" />
</a>
<div class="one">
<table>
<tr class="header">
<th>Serial No.</th>
<th>Set Name</th>
<th class="money">Set No</th>
<th class="money">Price</th>
<th class="money">Remove Item</th>
</tr>

<%
String s3=(String)session.getAttribute("u_name");
if(s3==null)
{
response.sendRedirect("Newlogin.jsp");
}
ArrayList<Phone2> ph=(ArrayList)session.getAttribute("getcart");
String s=request.getParameter(("code1"));
if(ph==null)
{
	out.println("<h1>No Items in Cart</h1>");
	
}
else
{
double total=0;
for(int a=0;a<ph.size();a++)
{
	Phone2 p=ph.get(a);
	total+=Double.parseDouble(p.getI_price());
	%>
<tr class="odd">
<td><%=a+1%></td>
<td><%=p.getSet_name() %></td>
<td class="money"><%=p.getSet_no() %></td>
<td class="money"><%=p.getI_price() %></td>
<td class="money"><a href="Remove.jsp?icode=<%=p.getSet_no()%>"><img src="cross.jpg" src="cross.jpg" height="30" width="30"></a></td>
</tr>
<%} %>
</table>
<br />
<br />
<a href="Shopkart.jsp"><h1>Continue Shopping</h1></a>
<div id="a">
<h3>Total Price=Rs.<%=total %></h3><%} %>
<fieldset>
<legend>PAYMENT OPTIONS</legend>
<input type="radio" name="pay" value="paycash" onchange="abc(this)"/>PAY BY CASH ON DELIVERY
<br />
<input type="radio" name="pay" value="cheque" onchange="abc(this)"/>
PAY BY CHEQUE/DD
<br />
<div id="pay1"></div>
<input type="radio" name="pay" value="card" onchange="abc(this)"/>CARD PAYMENT
<div id="pay2"></div>
<input type="submit" name="b1" value="Confirm Your Order">
</fieldset>
</div>
</div>
</form>
</body>
</html>