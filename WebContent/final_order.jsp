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
<%
HttpSession h=request.getSession();
String user_id=request.getParameter("user_id");
String pincode=request.getParameter("pincode");
String state=request.getParameter("state");
String address=request.getParameter("address");
String email_id=request.getParameter("email_id");
String mobile=request.getParameter("mobile");
String name=request.getParameter("name");
new_database obj=new new_database();
String date_=obj.get_date();
ResultSet r=obj.get_all_resultset(user_id);
String no="no";
while(r.next())
{
String seller_id=r.getString("seller_id");
String photo=r.getString("photo");
int quantity=r.getInt("quantity");
String cloth=r.getString("size_cloth");
System.out.println("size_cloth "+cloth+" "+cloth.length() );
if(cloth.equals(no) )
{
	int prev_quant=obj.get_quant(seller_id, photo);
	obj.reduce_quantity(seller_id,photo,quantity,prev_quant);
}
else
{
	//cloth=obj.get_name(seller_id,photo);dajndjkadkj
	int prev_quant=obj.get_quant_cloth(seller_id, photo,cloth);
	System.out.println("ppppp" + prev_quant+" "+seller_id+" "+photo+" "+quantity);
	obj.reduce_quantity_cloth(seller_id,photo,quantity,prev_quant,cloth);
}
String status="Order placed";
obj.insert_into_order_place(user_id,pincode,state,address,email_id,mobile,name,seller_id,photo,quantity,status,date_,cloth);// no
}
obj.delete_cart(user_id);
response.sendRedirect("done.jsp");

%>


</body>
</html>