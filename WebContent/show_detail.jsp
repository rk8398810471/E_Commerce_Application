<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="hello.*" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>  

var request;  
function hel()  
{  
	
var v=document.vv.quan.value;  
var url="cart_ajax2.jsp?val="+v; //quantity  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}    
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}    
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText; 
document.getElementById('demo1').innerHTML=val;  
}  
}  
 
function hello()  
{  
	var b=document.vv.size.value;
var v=document.vv.quantity.value;  
var url="cart_ajax.jsp?val="+v+"&size="+b; //quantity  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}    
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}    
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText; 
document.getElementById('demo1').innerHTML=val;  
}  
}  
 
</script> 
</script> 
</head>
<body>
<a href="show_products.jsp"><input type="button" value="back"></input></a>

<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache"); 
 response.setHeader("Expires","0");
HttpSession hb=request.getSession();
if(hb.getAttribute("id")==null)
{
	response.sendRedirect("user_login.jsp");
}
%>
<form action="Logout_user" method="post"  >
<input type="submit" value="Logout" >
</form>

<%!
String ll="0";
String s;
String m;
String l;
String xl;
String xxl;
new_database obj=new new_database();

String add;
%>
<%

String seller_id=(String)request.getParameter("seller_id");
String photo=(String)request.getParameter("photo");
ResultSet bb=null;
bb=obj.get_size(seller_id,photo);
while(bb.next())
{
	s=bb.getString("s");
	m=bb.getString("m");
	l=bb.getString("l");
	xl=bb.getString("xl");
	xxl=bb.getString("xxl");
	
	System.out.println("s="+s+"m="+m+"l="+l);
}
ResultSet r=null;

add=obj.get_address(seller_id);
r=(ResultSet)obj.get_data_for_update(seller_id,photo);
HttpSession h=request.getSession();

while(r.next())
{
	h.setAttribute("seller_id", r.getString("seller_id") );
	h.setAttribute("photo", r.getString("photo") );
	int dis=Integer.parseInt(r.getString("discount"));
	int f= r.getInt("price")*(100-dis)/100;
	
%>

<img heigth="200px" width="200px" alt="" src="<%=photo%>"><br>
<p>Item_name: <%= r.getString("item_name") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MRP Price: <%= r.getInt("price") %> Rs. </p>
<p>Discount <%= r.getString("discount") %>%  </p>
<form action="add_to_cart.jsp" name="vv">
<%
String ch="no";

if(r.getString("iscloth").equals(ch) )
{
	// yaha p krna hai....check
	HttpSession hbb=request.getSession();
	hbb.setAttribute("cloth", "no");
%>
<p>Availability:<%= r.getString("instock")%> In stock</p> <br>
Quantity:
 <select name="quan" onchange="hel()">
<option value="1">1
<option value="2">2
<option value="3">3
<option value="4">4
<option value="5">5
<option value="6">6
<option value="7">7
<option value="8">8
<option value="9">9
<option value="10">10
 
 </select>

 <%
}
else
{
	HttpSession hbb=request.getSession();
	hbb.setAttribute("cloth", "yes");
 %>

Sizes:

 <select name="size" id="p" onchange="hello()" >
 
<option value="s" 
<%

if(s.equals(ll) )
{
%>
disabled
<%} %>
>UpperWear: <b>S</b>/Waist: <b>28</b>/Footwear :<b>7</b></option>
<option value="m"
<%

if(m.equals(ll) )
{
%>
disabled
<%} %>
>UpperWear: <b>M</b>/Waist: <b>30</b>/Footwear :<b>8</b></option>
<option value="l"<%

if(l.equals(ll) )
{
%>
disabled
<%} %>>UpperWear: <b>L</b>/Waist: <b>32</b>/Footwear :<b>9</b></option>
<option value="xl"
<%

if(xl.equals(ll) )
{
%>
disabled
<%} %>
>UpperWear: <b>XL</b>/Waist: <b>34</b>/Footwear :<b>10</b></option>
<option value="xxl"
<%

if(xxl.equals(ll) )
{
%>
disabled
<%} %>
>UpperWear: <b>XXL</b>/Waist: <b>36</b>/Footwear :<b>11</b></option>
 </select>

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Quantity:
 <select name="quantity" onchange="hello()">
<option value="1">1
<option value="2">2
<option value="3">3
<option value="4">4
<option value="5">5
<option value="6">6
<option value="7">7
<option value="8">8
<option value="9">9
<option value="10">10
 
 </select>
  
 <%
 }
%>
<div id="demo1"></div>
  <h4 id="demo"></h4>
  
<p>Final price: <%= f %> Rs. </p>  
<p>Description: <br>
       <%= r.getString("description")%>
</p>
<%
}
String seller_name=obj.get_seller_name(seller_id);

%>
<p>Product by: <%= seller_name%><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=add%>
</p>

<input type="submit" value="add_to_cart">
</form>
<script>
function myFunction() {
  var x = document.getElementById("p").value;
   
  document.getElementById("demo").innerHTML = "You selected: " + x;
}
</script>

</body>
</html>