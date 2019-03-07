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
String filter=request.getParameter("filter");
HttpSession h=request.getSession();
String nu="null";

if(filter.equals(nu))
{
	h.setAttribute("apply",null);
}
else
{
h.setAttribute("apply",filter);
}
String name="yes";
RequestDispatcher rd=request.getRequestDispatcher("show_products.jsp?form="+name);  
rd.forward(request, response);
%>
</body>
</html>