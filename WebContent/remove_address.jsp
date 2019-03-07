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

new_database obj=new new_database();
String user=null;
HttpSession h=request.getSession();
user=(String)h.getAttribute("id");
obj.delete_address(request.getParameter("name"),request.getParameter("mobile"),request.getParameter("email_id"),request.getParameter("pincode"),request.getParameter("address"),user);
response.sendRedirect("checkout.jsp");
%>
</body>
</html>