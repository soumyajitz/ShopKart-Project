<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Register Page</title>
<style type="text/css">
@import url("front1css.css");
</style>
<script type="text/javascript">
function name1()
{
	if(document.f1.name.value.length<=0)
	{
			document.getElementById("name1").innerHTML="<img src='cross.png' height='20' width='20' /> Enter Correctly";
	}
	else
	{
			document.getElementById("name1").innerHTML="<img src='tick.jpg' height='20' width='20' />";
	}
}
function email1()
{
	if(document.f1.email.value.length<=8)
	{
			document.getElementById("email1").innerHTML="<img src='cross.png' height='20' width='20' /> Enter Correctly";
	}
	else
	{
			document.getElementById("email1").innerHTML="<img src='tick.jpg' height='20' width='20' />";
	}
}
function pass1()
{
	if(document.f1.pass.value.length==document.f1.cpass.value.length && document.f1.pass.value.length>0 && document.f1.pass.value.length>0)
	{
		    document.getElementById("cpass1").innerHTML="<img src='tick.jpg' height='20' width='20' /> Same";
	}
	else
	{
			document.getElementById("cpass1").innerHTML="<img src='cross.png' height='20' width='20' /> Not Same";
	}
}
function pass2()
{       
		if(document.f1.pass.value.length<5)
			document.getElementById("pas1").innerHTML="<img src='weak.png' height='20' width='80'/>";	
			else if(document.f1.pass.value.length>=5 && document.f1.pass.value.length<8)
			document.getElementById("pas1").innerHTML="<img src='medium.png' height='20' width='110'/>";	
			else
			document.getElementById("pas1").innerHTML="<img src='strong.png' height='20' width=140'/>";
}
function phn1()
{
var i=0;
var flag=0;
var a=document.f1.phno.value.toString();
b=new String(a);
	for(i=0;i<b.length;i++)
	{
		if(isNaN(b[i]))
		{
			flag=1;
		}
	}
	if(flag==1)
		{
		document.getElementById("p1").innerHTML="<img src='cross.png' height='20' width='20' /> Enter Valid No.";
		}
	else if(flag==0 && b.length>5)
		{
		document.getElementById("p1").innerHTML="<img src='tick.jpg' height='20' width='20' />";
		}
		else
		{
		document.getElementById("p1").innerHTML="<img src='cross.png' height='20' width='20' /> Length not Sufficient";
		}
}
function dates()
{
	if(document.f1.dob.value.length==0)
	{
		document.getElementById("d1").innerHTML="<img src='cross.png' height='20' width='20' /> Enter Correct Date";	
	}
	else
	{
		document.getElementById("d1").innerHTML="<img src='tick.jpg' height='20' width='20' />";
	}
	//alert(document.f1.dob.value.length);
}
function phot()
{
	if(document.f1.photo.value.length==0)
	{
		document.getElementById("phot1").innerHTML="<img src='cross.png' height='20' width='20' />";
	}
	else
	{
		document.getElementById("phot1").innerHTML="<img src='tick.jpg' height='20' width='20' />";	
	}
}
function load1()
{
	document.f1.name.focus();
}
</script>
</head>

<body onload="load1()">
<div id="container">
<div id="header1">
<div id="firstpart">
</div>
<div id="secondpart">
</div>
</div>
<div id="margin1">
<br/>
<br/>
<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="home.php">&nbsp;&nbsp;&nbsp;&nbsp;HOME&nbsp;&nbsp;&nbsp;&nbsp;</a></br><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="register.php">&nbsp;&nbsp;REGISTER&nbsp;</a></br><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/about.php">&nbsp;ABOUT US&nbsp;</a></br><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="faq.php">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FAQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></br><br/><br/><br/>
</div>
<div id="insider">
<form name="f1" action="register3.php" method="post">
<fieldset>
<b><legend>Registration</legend></b>
<b>
<table>
<tr><td>Name</td><td colspan="2"> <input type="text" name="name" id="name" size="35" onblur="name1()"/></td><td id="name1" ></td></tr><br />
<tr><td>Email</td><td colspan="2"><input type="email" name="email" id="email" size="35" onblur="email1()" /></td><td id="email1"></td></tr><br />
<tr><td>Password</td><td colspan="2"><input type="password" name="pass" id="pass" size="35" onkeyup="pass2()" onblur="pass2()"/></td><td id="pas1"></td></tr><br />
<tr><td>Confirm Password</td><td colspan="2"><input type="password" name="cpass" id="cpass" size="35" onkeyup="pass1()" onblur="pass1()" /></td><td id="cpass1"></td></tr><br />
<tr><td>Phone Number</td><td colspan="2"><input type="text" name="pno" id="phno" size="35" placeholder="(+91)XXXXX-YYYYY" onkeyup="phn1()"/></td><td id="p1"></td></tr><br />
<tr><td>Date of Birth</td><td colspan="2"><input type="date" id="date1" name="dob" id="dob" size="35"  onblur="dates()"/></td><td id="d1"></td></tr><br />
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="butt1" name="b" value="Register" /></td></tr>
</table>
</b>
</fieldset>
</div>
</form>
<div id="footer1"></div>
</div>

</body>
</html>
