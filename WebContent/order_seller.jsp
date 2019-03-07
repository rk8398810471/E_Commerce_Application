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
<script>  
var request;  
function b()  
{  
var v=document.vv.id.value;  
document.getElementById('demo').innerHTML=v;  
}  
</script> 
</head>
<body>
<a href="seller_after_log.jsp"><input type="button" value="back"></input></a>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache"); 
 response.setHeader("Expires","0");
HttpSession hb=request.getSession();
if(hb.getAttribute("username")==null)
{
	response.sendRedirect("seller_login.jsp");
}
%>
<form action="Logout" method="post">
<input type="submit" value="logout">
</form>
<form name="vv">
<table>
<%
new_database obj=new new_database();
HttpSession f=request.getSession();
String id=(String)f.getAttribute("username");
System.out.println(id);
ResultSet r=obj.get_orders(id);
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
<%
hb.setAttribute("dat",r.getString("date_"));
%>
<td>Address:<br>
<%=r.getString("address") %><br>
<%=r.getString("email_id") %><br>
<%=r.getString("mobile") %><br>
<%=r.getString("name") %><br>
<%=r.getString("state") %><br>
<%=r.getString("pincode") %><br>
</td>
<td>Status: <%=r.getString("status") %></td>
<td>
<a href="status_approve.jsp?date=<%=r.getString("date_")%>&size=<%=m %>&user_id=<%=r.getString("user_id") %>&seller_id=<%=r.getString("seller_id") %>&photo=<%=r.getString("photo") %>">update_status</a>

</td>
</tr>

<%} %>

</table>

</form>
</body>
</html>