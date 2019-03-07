<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession hs=request.getSession();
hs.setAttribute("search",null);

response.sendRedirect("seller_after_log.jsp");
%>
</body>
</html>