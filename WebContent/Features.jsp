<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="mob.*,javax.sql.*,java.sql.*,javax.naming.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Full Specs</title>
</head>
<body>
<form method="get" action="Confirm.jsp">
<%
String s1=(String)session.getAttribute("u_name");
ArrayList<Phone2> aw=(ArrayList)session.getAttribute("getcart");
Phone2 p=new Phone2(" "," "," ");
int count=1;
Context ctx=new InitialContext();
DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
Connection con=ds.getConnection();
String ic=request.getParameter("code");
PreparedStatement ps=con.prepareStatement("select * from item_details where set_no=?");
ps.setString(1,ic);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
%>
<link href="Features.css" type="text/css" rel="stylesheet" />
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<div id="top" >
<div id="top1">
<ul>
<li>  <a href="Shopkart.jsp">Home </a></li>
<%if(s1==null)
	{
	%>
<li> <a href="Newlogin.jsp"> | Login </a></li>
<li> <a href="Newlogin.jsp"> | Sign Up</a> </li><%} %>
<%if(s1!=null)
	{
	%>
<li>  <a href="Logout.jsp"> | Logout </a></li>
</ul>

     <h3 id="top2"> WELCOME, 
<%=s1%>
<%} %>
</h3>
</div>
<a href="Shopkart.jsp" >
<img src="big1.jpg" height="120" width="400" />
</a>
<div class="spry1">
<ul id="MenuBar1" class="MenuBarHorizontal"  >
  <li><a class="MenuBarItemSubmenu" href="#">By Price</a>
    <ul>
      <li><a href="byprice.jsp?price=2000-5000">Rs.2000-5000.</a></li>
      <li><a href="byprice.jsp?price=5000-10000">Rs.5000-10000.</a></li>
      <li><a href="byprice.jsp?price=10000-100000">Above Rs.10000</a></li>
    </ul>
  </li>
  <li><a href="#">By Brand</a>
  <ul>
      <li><a href="bybrand.jsp?brand=Nokia">Nokia</a></li>
      <li><a href="bybrand.jsp?brand=Samsung">Samsung</a></li>
      <li><a href="bybrand.jsp?brand=Apple">Apple</a></li>
    </ul>
  </li>
  <li><a class="MenuBarItemSubmenu" href="#">By Features</a>
    <ul>
      <li><a href="#">3G</a> </li>
      <li><a href="#">E-mail</a></li>
      <li><a href="#">Bluetooth</a></li>
    </ul>
  </li>
  <li><a href="#">By Type</a>
  <ul>
      <li><a href="byos.jsp?brand=Android">Android</a> </li>
      <li><a href="byos.jsp?brand=Symbian">Symbian</a></li>
      <li><a href="byos.jsp?brand=IOS">IOS</a></li>
    </ul>
  </li>
</ul>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</div>
<div class="one">
<div class="two">
<div class="frames">
<img src=<%=rs.getString(3) %> width="300" height="350" >
</div>
<div class="kart">
<div class="smallspecs">
<ul>
<%

String ab3=rs.getString(1);
p.setSet_no(ab3);
	session.setAttribute("set_no",ab3);%>
<%String ab1=rs.getString(4);
p.setI_price(ab1);
	session.setAttribute("i_price",ab1);%>
<li><b>Price:Rs<%=ab1%></b></li>
<br>
<br>
<li><b>Color:<%=rs.getString(5) %></b></li>
<br>
<br>
<%String ab2=rs.getString(2);
p.setSet_name(ab2);
	session.setAttribute("set_name",ab2);%>
<li><b>Setname:<%=ab2 %></b></li>
<br>
<br>
<%String ab=rs.getString(6);
	session.setAttribute("i_os",ab);%>
<li><b>OS:<%= ab%></b></li>
<br>
<br>
<li><b>Brand:<%=rs.getString(7) %></b></li>
</ul>
</div>
<div class="buynow">
<a href="Confirm.jsp?code1=<%=count%>">

<img src="buynow button2.png">
</a>
</div>
</div>
</div>
<div class="specs">
<h2>Specifications:</h2>
<br>
<b><%=rs.getString(8) %></b>
</div>
</div>
</div>
<%} 
if(aw==null)
{
	aw=new ArrayList<Phone2>();
	
}
aw.add(p);
session.setAttribute("getcart",aw);
%>
</form>
</body>
</html>