<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="hello.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="order_seller.jsp">order_enquiry</a>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache"); 
 response.setHeader("Expires","0");
HttpSession h=request.getSession();
if(h.getAttribute("username")==null)
{
	response.sendRedirect("seller_login.jsp");
}
%>
<center>
<form action="Logout" method="post">
<input type="submit" value="logout">
</form>
<%
new_database obj=new new_database();
HttpSession hs=request.getSession();
String id=(String)hs.getAttribute("username");
String search=(String)hs.getAttribute("search");
String welcome=obj.get_welcome_name(id,2);
%>
<center><p >Welcome:<br><%= welcome %></p></center>
</center>
<a href="cloth_other_product.jsp">add data</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<form action="after_search.jsp" method="post">
search: <input placeholder="Search Here...." name="search"><br>
</form>

<br>

<form action="show_seller_seller.jsp" method="post">
<input type="submit" value="show_all_products"><br>

</form><br>
<table>
<tr>
<th>photo</th>
<th>discount</th>
<th>price</th>
<th>instock</th>
<th>item_name</th>
<th>description</th>
<th>Action</th>
</tr>
<% 

System.out.println("hellog "+id+" kk0");

//String search=(String)hs.getAttribute("search");
//System.out.println("search "+search);
System.out.println("search "+search);
ResultSet r=null;
if(search==null)
 r=(ResultSet)obj.get_data_for_edit(id);
else
	r=(ResultSet)obj.get_data_for_edit_search(id,search);
String vv=null;
while(r.next())
{
	
%>

<tr>
<td><img height="150" width="150" src="<%= r.getString("photo")%>"></img></td>
<td><%= r.getString("discount")%></td>
<td><%= r.getInt("price")%></td>
<td><% if(r.getString("instock")==vv )
{%>
<p>Size dependent</p>
<%} else{%>
<p><%= r.getString("instock") %>
<%} %>
</td>
<td><%= r.getString("item_name")%></td>
<td><%= r.getString("description")%></td>
<td><a href="remove_seller_data.jsp?id=<%=r.getString("seller_id")%>&photo=<%=r.getString("photo") %>&cloth=<%=r.getString("iscloth") %>">remove</a><br><a href="update_seller_data.jsp?id=<%=r.getString("seller_id")%>&photo=<%=r.getString("photo") %>&cloth=<%=r.getString("iscloth") %>">update</a></td>
</tr>
<%
}
%>
</table>
</body>
</html>