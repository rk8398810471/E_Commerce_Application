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
<%
String seller=request.getParameter("seller");
String photo=request.getParameter("photo");
String size=request.getParameter("size");
HttpSession h=request.getSession();
String user=(String)h.getAttribute("id");

System.out.println(seller+""+photo+""+size+""+user);
new_database obj=new new_database();
obj.remove_cart(user,seller,photo,size);
response.sendRedirect("show_cart.jsp");
%>
</body>
</html>