<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="hello.*" %>
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

HttpSession hs=request.getSession();

String id=(String)hs.getAttribute("username");
int price=Integer.parseInt(request.getParameter("price"));
String discount=request.getParameter("discount");
String instock="";//request.getParameter("stock");
String item_name=request.getParameter("item_name");
String description=request.getParameter("description");
String photo=request.getParameter("photo");
new_database obj=new new_database();
String cloth=request.getParameter("cloth");
String b="yes";
System.out.println("ff"+id+photo);
if(cloth.equals(b) )
{
	instock=null;
	String s=request.getParameter("s");
		String m=request.getParameter("m");
		String l=request.getParameter("l");
		String xl=request.getParameter("xl");
		String xxl=request.getParameter("xxl");
		obj.update_sizes(id,photo,s,m,l,xl,xxl);
	
}
else
{
	instock=request.getParameter("stock");
}

obj.enter_data_for_update(price,discount,instock,item_name,description,photo,id);

RequestDispatcher rd=request.getRequestDispatcher("seller_after_log.jsp");  
rd.forward(request, response);
%>
</body>
</html>