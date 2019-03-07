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
<%
HttpSession hp=request.getSession();
String user_id=(String)hp.getAttribute("id");
String seller_id=(String)hp.getAttribute("seller_id");//
String photo=(String)hp.getAttribute("photo");// ok report
String cloth=(String)hp.getAttribute("cloth"); //
String l="yes";
new_database obj=new new_database();
String size="no";


int quantity=Integer.parseInt(request.getParameter("val"));

int check_quantity=obj.at_checkout(seller_id,photo,size);
if(check_quantity>=quantity)
{
	out.println("<b>In Stock</b>");
}
else
{
	out.println("<b>Reduce your quantity....Stock is not more</b>");
			
}
System.out.println("Ajax="+size+" "+quantity);
%>

</head>
<body>

</body>
</html>
