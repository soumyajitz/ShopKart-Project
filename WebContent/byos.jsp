<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="mob.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopkart.com</title>
<link href="Shopkartcss.css" type="text/css" rel="stylesheet" />
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>
<body>
<%String s1=(String)session.getAttribute("u_name"); %>
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
      <li><a href="byprice.jsp?price=10001-100000">Above Rs.10000</a></li>
    </ul>
  </li>
  <li><a href="#">By Brand</a>
  <ul>
      <li><a href="bybrand.jsp?brand=Nokia">Nokia</a></li>
      <li><a href="bybrand.jsp?brand=Samsung">Samsung</a></li>
      <li><a href="bybrand.jsp?brand=Apple">Apple</a></li>
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
<div class="twotwo">

<%
String sp=request.getParameter("brand");
Context ctx=new InitialContext();
DataSource ds=(DataSource)ctx.lookup("java:OracleDS");
Connection con=ds.getConnection();
PreparedStatement ps;
	ps=con.prepareStatement("select * from item_details where i_os=?");
	ps.setString(1,sp);

ResultSet rs=ps.executeQuery();
ArrayList<Phone1> al=new ArrayList<Phone1>();
while(rs.next())	
{
	Phone1 ph=new Phone1();
	ph.setSet_no(rs.getString(1));
	ph.setSet_name(rs.getString(2));
	ph.setImgpath(rs.getString(3));
	ph.setI_price(rs.getString(4));
	ph.setI_color(rs.getString(5));
	ph.setI_os(rs.getString(6));
	ph.setI_brand(rs.getString(7));
	ph.setI_spec(rs.getString(8));
	ph.setI_comment(rs.getString(9));
	al.add(ph);
}
%>
<table border="1">
<% for(int i=0;i<al.size();i++)
{
	Phone1 ph1=(Phone1)al.get(i);
	
%>

<tr>
<td class="two">
<img src=<%=ph1.getImgpath() %> border="2" height=150 width=150><br><%=ph1.getSet_name() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><a href="Features.jsp?code=<%=ph1.getSet_no() %>">More Details</a></td>
</tr>
<br>


<%} %>
</table>
</div>
</div>
</body>
</html>