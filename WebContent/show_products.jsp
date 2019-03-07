<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %>
      <%@page import="java.util.*" %>
    <%@page import="hello.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<script>  

var request;  
function sear()  
{  
var v=document.getElementById("fname").value;
document.getElementById("oo").innerHTML=v;
var url="after_search_items.jsp?s="+v+"";  
  
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
	document.getElementById('dem').innerHTML=val; 
}  
}  
 


function sendInfo()  
{  
var v=document.pp.filter.value;  
var url="filter.jsp?filter="+v;  
  
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
	document.getElementById('dem').innerHTML=val; 
}  
}  
 
</script> 

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body >
<% 
HttpSession hmm=request.getSession();
String search_item=(String)hmm.getAttribute("search_item");
String u="yes";
String form=request.getParameter("form");
if(form==null)
{
form="";	
}
if(form.equals(u) )
{
	
}
else
{
%>
<center>
<form  name="ii">
Search:<input name="search" value='<%= search_item %>' onkeyup="sear()" id="fname">
</form>
</center>
<%} %>
<div id="dem">
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
<form action="Logout_user" method="post">
<input type="submit" value="Logout" >
</form>

<%
new_database obj=new new_database();
String id,search,apply;
HttpSession h=request.getSession();

id=(String)h.getAttribute("id");
int line=obj.cart_lines(id);
search=(String)h.getAttribute("search");
apply=(String)h.getAttribute("apply");
System.out.println("apply "+apply);
String welcome=obj.get_welcome_name(id,1);

%>
<center><p >Welcome:<br><%= welcome %></p></center>
<a href="my_order.jsp">my_orders</a>
<center><a href="show_cart.jsp">Cart</a><br>
<%if(line==0) {%>
<b>Cart Is Empty</b>
<%} else{%>
<b><%= line %> Items in Cart</b>
<%} %>
</center>


<form action="show_show.jsp" method="post">
<input type="submit" value="show_all_products" >
</form>
<center>

<p id="oo"></p>
<form action="filter.jsp" name="pp">
<input type="radio" name="filter" onclick="sendInfo()" value="1000"  
<c:if test="${apply == '1000'}">  
   checked 
</c:if>
> below 1000<br>
  <input type="radio" name="filter" onclick="sendInfo()" value="2000"<c:if test="${apply == '2000'}">  
   checked 
</c:if>>below 2000<br>
  <input type="radio" name="filter" onclick="sendInfo()" value="5000"<c:if test="${apply == '5000'}">  
   checked 
</c:if>> below 5000<br>
  <input type="radio" name="filter" onclick="sendInfo()" value="10000"<c:if test="${apply == '10000'}">  
   checked 
</c:if>> below 10000<br>
  <input type="radio" onclick="sendInfo()" name="filter" value="null"
 <c:if test="${apply==null  }">  
   checked 
</c:if>
  >no filter<br>
  
</form>


<h3>Products</h3>
<table cellspacing="3px" cellpadding="10px">
<tr >

<% 



ResultSet r=null;
if(search==null && apply==null)
r=(ResultSet)obj.show_all_products();
else
{
	if(search==null && apply!=null)
	{
		r=(ResultSet)obj.show_all_products_price(apply);// string
	}
	else
	{
		if(search!=null && apply==null)
		{
			r=(ResultSet)obj.show_all_products_search(search);
		}
		else
		{
			r=(ResultSet)obj.show_all_products_search_price(apply,search);
		}
	}
}
int i=0;
while(r.next())
{
	if(i==4)
	{
		out.print("</tr><tr>");
		i=0;
	}
	
i++;
%>

<td>

<a href="show_detail.jsp?seller_id=<%=r.getString("seller_id")%>&photo=<%=r.getString("photo")%>" >
<img height="150" width="150" src="<%= r.getString("photo")%>"></img>
<br>
<%= r.getString("item_name")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price: <%= r.getInt("price")%>Rs.
<br>
</a>
</td>
<%
}
%>

</tr>
</table>
</center>
</div>
</body>
</html>