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
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache"); 
 response.setHeader("Expires","0");
HttpSession hb=request.getSession();
if(hb.getAttribute("username")==null)
{
	response.sendRedirect("seller_login.jsp");
}
%>


<form action="Logout" method="post">
<input type="submit" value="logout">
</form>
<a href="seller_add.jsp?clothes=true"><input type="button" value="Clothes / Shoes"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="seller_add.jsp?clothes=false"><input type="button" value="Other Products"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="seller_after_log.jsp"><input type="button" value="Back"></input></a>
</body>
</html>