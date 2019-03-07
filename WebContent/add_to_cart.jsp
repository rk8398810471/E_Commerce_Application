<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %>
      <%@page import="java.io.*" %>
    <%@page import="hello.*" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession hp=request.getSession();
System.out.println("check 1");
String seller_id=(String)hp.getAttribute("seller_id");//
String photo=(String)hp.getAttribute("photo");// ok report
String user_id=(String)hp.getAttribute("id");// done from starting
int quantity=0;
String cloth=(String)hp.getAttribute("cloth"); //
String l="yes";
new_database obj=new new_database();
String size="no";
System.out.println(seller_id+" "+photo+" "+user_id+" "+quantity+" "+cloth);
request.setAttribute("seller_id",seller_id);
request.setAttribute("photo",photo);
if(cloth.equals(l)){
 size=request.getParameter("size");
 quantity=Integer.parseInt(request.getParameter("quantity"));
}
else
{
	quantity=Integer.parseInt(request.getParameter("quan"));
}
if(obj.already_present_in_cart(seller_id,user_id,photo,size))
{
	System.out.println("check hogya");
	if(cloth.equals(l))
	{
		int check_quantity=quantity+obj.get_quantity_from_cart(seller_id,photo,user_id);
		if(check_quantity<=obj.get_quantity_from_cloth_size(seller_id,photo,size))
		{
			obj.update_cart(seller_id,user_id,photo,quantity);
			out.println("<b>Added Successfully</b>");
			%>
			<a href="show_cart.jsp"><input type="button" value="Go to cart"></input></a>
			<% 
			RequestDispatcher rd=request.getRequestDispatcher("show_detail.jsp?seller_id="+seller_id+"&photo="+photo+"");  
 rd.include(request, response);
		}
		else
		{
			out.println("<b>you should try with less quantity ... You have already in cart</b>");
			RequestDispatcher rd=request.getRequestDispatcher("show_detail.jsp?seller_id="+seller_id+"&photo="+photo+"");  
 rd.include(request, response);
		}
	}
	else
	{	
	int check_quantity=quantity+obj.get_quantity_from_cart(seller_id,photo,user_id);
	if(check_quantity<=obj.get_quantity_from_seller_items(seller_id,photo) )
	{
		obj.update_cart(seller_id,user_id,photo,quantity);
		out.println("<b>Added Successfully</b>");
		%>
		<a href="show_cart.jsp"><input type="button" value="Go to cart"></input></a>
		<% 
		RequestDispatcher rd=request.getRequestDispatcher("show_detail.jsp?seller_id="+seller_id+"&photo="+photo+"");  
rd.include(request, response);
	}
	else
	{
		out.println("<b>you should try with less quantity ... You have already in cart</b>");
		RequestDispatcher rd=request.getRequestDispatcher("show_detail.jsp?seller_id="+seller_id+"&photo="+photo+"");  
rd.include(request, response);
	}	
	}
}
else
{	
int check_quantity=obj.at_checkout(seller_id,photo,size);
		if(check_quantity>=quantity)
		{
			obj.data_into_cart(seller_id,photo,user_id,quantity,size);
			out.println("<b>Added Successfully</b>");
			%>
			<a href="show_cart.jsp"><input type="button" value="Go to cart"></input></a>
			<% 
			RequestDispatcher rd=request.getRequestDispatcher("show_detail.jsp?seller_id="+seller_id+"&photo="+photo+"");  
 rd.include(request, response);
		}
		else
		{
			out.println("<b>you should try with less quantity ... Stock is Not more</b>");
						RequestDispatcher rd=request.getRequestDispatcher("show_detail.jsp?seller_id="+seller_id+"&photo="+photo+"");  
		     rd.include(request, response);
					System.out.println("heheh");
		} 
	}

%>
</body>
</html>