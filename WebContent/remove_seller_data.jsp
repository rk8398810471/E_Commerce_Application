<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="hello.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
HttpSession h=request.getSession();
if(h.getAttribute("username")==null)
{
	response.sendRedirect("seller_login.jsp");
}
%>

<%
String cloth=request.getParameter("cloth");
String id=request.getParameter("id");
String photo=request.getParameter("photo");
new_database obj=new new_database();
obj.delete_by_seller(id,photo);
String ch="yes";
if(cloth.equals(ch))
{
	obj.delete_size(id,photo);
}
//request.setAttribute("id",id);
RequestDispatcher rd=request.getRequestDispatcher("/seller_after_log.jsp");  
rd.forward(request, response);
%>
</body>
</html>