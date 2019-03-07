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

if(request.getParameter("val")=="")
{
	out.print("Enter a Unique Id"); 
}
else
{
String id=request.getParameter("val");  
new_database obj=new new_database();
boolean check=obj.already_id_present(id,2);
if(check==true)
{
	out.print("<b> Already Exist</b>");
}
else
{
	out.print("<b> ok</b>");
}
}
%>

</body>
</html>