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
String date=(String)h.getAttribute("date");
String user_id=request.getParameter("user_id");
String seller_id=request.getParameter("seller_id");
String photo=request.getParameter("photo");
String status=request.getParameter("status");
String size=request.getParameter("size");
System.out.println(user_id+" "+seller_id+" "+photo+" "+status+" "+size);
new_database obj=new new_database();
obj.lll(user_id,seller_id,photo,status,size,date);
obj.l();
response.sendRedirect("order_seller.jsp");
%>
</body>
</html>