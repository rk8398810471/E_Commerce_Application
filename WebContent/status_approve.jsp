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
<a href="order_seller.jsp"><input type="button" value="back"></input></a>
<form action="done_done.jsp">
<select name="status">
<option value="packed">packed
<option value="shipped">shipped
<option value="delivered">delivered
</select>
<input type="submit">
<%
HttpSession h=request.getSession();
h.setAttribute("date",request.getParameter("date"));
System.out.println(request.getParameter("date"));
%>


<input type="hidden" name="size" value=<%=request.getParameter("size") %>>
<input type="hidden" name="user_id" value=<%=request.getParameter("user_id") %>>
<input type="hidden" name="seller_id" value=<%=request.getParameter("seller_id") %>>
<input type="hidden" name="photo" value=<%=request.getParameter("photo") %>> 
</form>



</body>
</html>