<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
    <%@page import="hello.*" %>
    <%@page import="java.util.*" %>
    <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="my_order.jsp"><input type="button" value="back"></input></a>

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

<table>
<%
//item_name like '%"+search+"%'"
new_database obj=new new_database();
HttpSession f=request.getSession();
String id=(String)f.getAttribute("id");
System.out.println(id);
ResultSet r=obj.get_order_delivered(id);
ResultSet rv=obj.get_order_delivered(id);
int flag=0;

while(r.next())
{
	System.out.println("jjjjj");
%>
<tr>
<td><img  src=<%=r.getString("photo") %>></img></td>
<td>Name: 
<%=
obj.seller_items_name(r.getString("seller_id") , r.getString("photo") )
%>
</td>
<td>Size: 
<%
String m=r.getString("size_of");
String h="no";
if(h.equals(m))
{
%>
<p>Item dependent</p>
<%}else{ %>
<%= m %>
<%} %>

</td>
<td>Quantity: <%=r.getString("quantity") %></td>
<td>Date of Placed: <%=r.getString("date_") %></td>
<td>Status: <%=r.getString("status") %></td>
</tr>

<%} %>
</table>
<%
if(rv.next())
{
	
}
else
{
	%>
	<h1>No Order Delivered Till Yet</h1>
	<%
}
%>
</body>
</html>