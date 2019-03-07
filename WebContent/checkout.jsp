<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
<a href="show_cart.jsp"><input type="button" value="back"></input></a>
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
int flag=0;
new_database obj=new new_database();

HttpSession h=request.getSession();
h.setAttribute("after_checkout", "yes");
String checkout=(String)h.getAttribute("checkout");

if(checkout==null)
{
	
}
else
{
	response.sendRedirect("show_cart.jsp");
}
String id=(String)h.getAttribute("id");
//System.out.println(id);

ResultSet r=null;

//ResultSet result=null;//
r=(ResultSet)obj.get_all_add(id); 
//String g_id="";

//g_id=r.getString("user_id");
//System.out.println(g_id);
if(!r.next())
{
	
	%>
	<p><b>No Saved Addresses</b></p>
	<% 
}
else
{
	flag=1;
	%>
	<tr>
	<td>Name</td>
	<td>mobile no.</td>
	<td>Email_id</td>
	<td>pincode</td>
	<td>address</td>
	</tr>
	<br>
	<% 
}

/* result=(ResultSet)obj.get_all_resultset(id);
String photo="";
String size="";
int quantity;
String seller_id="";
String discount="";
String item_name="";
int price=0;
int final_price=0;
int dis=0,ffff=0,xxx=0;
 */
 if(flag==1)
 {
do{
	 
%>
<tr>
<td><%= r.getString("name") %></td>
<td><%=r.getString("mobile")%></td>
<td><%=r.getString("email_id")%></td>
<td><%=r.getString("pincode")%></td>
<td><%=r.getString("address")%></td>
<td><a href="remove_address.jsp?name=<%=r.getString("name") %>&mobile=<%=r.getString("mobile") %>&email_id=<%=r.getString("email_id") %>&pincode=<%=r.getString("pincode") %>&address=<%=r.getString("address") %>">remove</a><br>
<a href="save_address.jsp?state=<%=r.getString("state") %>&name=<%=r.getString("name") %>&mobile=<%=r.getString("mobile") %>&email=<%=r.getString("email_id") %>&pincode=<%=r.getString("pincode") %>&address=<%=r.getString("address") %>">use this</a></td>

</tr><br>
<%}while(r.next()); 

}%>
</table>


<form action="checkout2.jsp">
<input type="submit" value="Add and continue">
</form>

</body>
</html>