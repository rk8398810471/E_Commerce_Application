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
<form action="Logout_user" method="post">
<input type="submit" value="Logout" >
</form>


<table>

<% 
new_database obj=new new_database();

HttpSession h=request.getSession();
String j=(String)h.getAttribute("checkout");
String after_checkout=(String)h.getAttribute("after_checkout");
if(j==null || after_checkout==null)
{
	
}
else
{
	%>
	<p><b>You should Have Remove 'Out Of Stock' Products</b></p>
	<%
}
h.setAttribute("after_checkout", null);
h.setAttribute("checkout", null);
String id=(String)h.getAttribute("id");
ResultSet r=null;
ResultSet result=null;
ResultSet rv=null;
r=(ResultSet)obj.get_all_resultset(id);
result=(ResultSet)obj.get_all_resultset(id);
rv=(ResultSet)obj.get_all_resultset(id);
String photo="";
String size="";
int quantity;
String seller_id="";
String discount="";
String item_name="";
int price=0;
int final_price=0;
int dis=0,ffff=0,xxx=0;
h.setAttribute("resultset",r);
while(r.next()){
	 photo=r.getString("photo");
	 size=r.getString("size_cloth");
	quantity=r.getInt("quantity");
	 seller_id=r.getString("seller_id");
	 price=obj.get_pri(seller_id,photo);
	 discount=obj.get_dis(seller_id,photo);
	 item_name=obj.get_nam(seller_id,photo);
	 if(discount!="" || discount==null )
	 dis=Integer.parseInt(discount);
	final_price=quantity*(price-(price*dis)/100);
	%>
		
<tr>
<td>
<%if(obj.at_checkout(seller_id,photo,size)<quantity )
{
	h.setAttribute("checkout", "no"); %>
<div><b>out of stock</b></div>
<%
		
	}
%>

<img height="70" width="70" src="<%= photo%>"></img></td>

<td><%=item_name%><br>
Quantity:<%=quantity%><br>
<%
String check="no";
if(size.equals(check)){
%>
 <p></p>
 <%}else{ %>
 Size:<%=size%><br>
 <%} %>
 </td>
<td></td> 
 
<td> MRP per quantity:<%= price%>   <br>
Discount:<%= discount%>%
<br>
Final price:<%= final_price %> 
</td>
<td><a href="remove_cart.jsp?seller=<%=r.getString("seller_id") %>&photo=<%=r.getString("photo") %>&size=<%=r.getString("size_cloth") %>">remove</a></td>
</tr>
<%
ffff=ffff+price*quantity;
xxx=xxx+final_price;
}
%>
</table>
<%
if(rv.next())
{
	%>
	<p>Total MRP Price :<%= ffff %></p>
<p>Discounted Price: <%= xxx %></p>
	<form action="checkout.jsp">
<input type="submit" value="Checkout">
</form>
<%
}
else
{
	%>
	<h1>Cart is Empty....</h1>
	
	<%
}
%>
<%

h.setAttribute("mrp",ffff);
h.setAttribute("dis",xxx);
%>


 </body>
</html>