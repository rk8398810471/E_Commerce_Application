<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% HttpSession h=request.getSession();
if(h.getAttribute("username")==null)
{
	response.sendRedirect("seller_login.jsp");
}
%>

<%
HttpSession hs=request.getSession();
String id=(String)hs.getAttribute("username");

String search=request.getParameter("search");

hs.setAttribute("search",search);

RequestDispatcher rd=request.getRequestDispatcher("seller_after_log.jsp");  
rd.forward(request, response);
%>
</body>
</html>