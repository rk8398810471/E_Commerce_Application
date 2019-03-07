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
String search=request.getParameter("s");
System.out.println("yes");
String s="";
HttpSession h=request.getSession();
//s=(String)h.getAttribute("search_item");
s=s+search; 
h.setAttribute("search_item",s);
h.setAttribute("search",search); // may be not in use
h.removeAttribute("apply");
String name="yes";
RequestDispatcher rd=request.getRequestDispatcher("show_products.jsp?form="+name);  
rd.forward(request, response);
%>
</body>
</html>