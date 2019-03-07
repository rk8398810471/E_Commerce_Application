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
HttpSession f=request.getSession();
//String s=(String)f.getAttribute("city");
String pin=request.getParameter("pincode");
//f.setAttribute("pincode",pin);
new_database obj=new new_database();
int line =obj.get_linenumber(pin);
PrintWriter p=response.getWriter();
if(line==0)
{
	System.out.println("kkk");
	f.setAttribute("pincode",null);
	f.setAttribute("city",null);
	
	p.print("<b>Enter a valid pincode</b>");
	RequestDispatcher rd=request.getRequestDispatcher("checkout2.jsp");  
    rd.include(request, response);
}
else
{
	System.out.println("jjjj");
	String city=obj.get_state(line);
	f.setAttribute("pincode",pin);
	f.setAttribute("city",city);
	response.sendRedirect("checkout2.jsp");
}

%>

</body>
</html>