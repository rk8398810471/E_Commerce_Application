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
<a href="checkout.jsp"><input type="button" value="back"></input></a>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache"); 
 response.setHeader("Expires","0");
HttpSession hb=request.getSession();
if(hb.getAttribute("id")==null)
{
	response.sendRedirect("user_login.jsp");
}
%>
<form action="Logout_user" method="post">
<input type="submit" value="Logout" >
</form>
<%
HttpSession f=request.getSession();
String u="yes";
ResultSet re=null;
int dis=0;
int mrp=0;
String pin="";

String city="";


String id=(String)f.getAttribute("id");

String address=request.getParameter("address");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String name=request.getParameter("name");

new_database obj=new new_database();
pin=(String)f.getAttribute("pincode");
if(pin==null)
{
	pin=request.getParameter("pincode");
}
if(pin==null)
{
	PrintWriter p=response.getWriter();
	p.print("<b>Please choose a valid pincode</b>");
	RequestDispatcher rd=request.getRequestDispatcher("checkout2.jsp");  
    rd.include(request, response);
}
else
{
if(request.getParameter("state")==null)
{
	// ulr not
	city=(String)f.getAttribute("city");

	obj.insert_into_add_ress(id,pin,city,address,email,mobile,name);
}
else
{
	city=request.getParameter("state");
	
}

}

if(pin==null)
{
	
}
else
{
	
	%>
	<h2>Address... </h2>
	<%=name %><br>
	<%=mobile %><br>
	<%=email %><br>
	<%=address %><br>
	<%=city %><br>
	<%=pin %><br>
<% 
HttpSession fr=request.getSession();

	dis=(Integer)fr.getAttribute("dis");
	mrp=(Integer)fr.getAttribute("mrp");
	
%>
<br>
<br>
<br>
<h3>Order summary</h3><br>
<p>Mrp price: <%=mrp %></p>
<p>Total Discounted: <%= dis%></p>
<input type="radio" checked> Cash on delivery<br>
<form action="final_order.jsp">
<input type="hidden" name="user_id" value=<%=id %>>
<input type="hidden" name="pincode" value=<%=pin %>>
<input type="hidden" name="state" value=<%=city %>>
<input type="hidden" name="address" value=<%=address %>>
<input type="hidden" name="email_id" value=<%=email %>>
<input type="hidden" name="mobile" value=<%=mobile %>>
<input type="hidden" name="name" value=<%=name %>>

<input type="submit" value="Place_order">
</form> 


<% 	
}
%>
</body>
</html>