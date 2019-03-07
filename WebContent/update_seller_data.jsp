<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="hello.*"%>
    <%@page import="java.sql.*" %>
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
<center>
<form action="Logout" method="post">
<input type="submit" value="logout">
</form></center>
<form action="update_seller_data2.jsp" method="post">
<%!
String st="";
ResultSet r;
%>
<%
String id=request.getParameter("id");
String photo=request.getParameter("photo");
new_database obj=new new_database();
 r=(ResultSet)obj.get_data_for_update(id,photo);
 
//session.setAttribute("id",id);
while(r.next()){
	st=  r.getString("instock"); 
	System.out.println("ppp"+id);
%>
<img alt="" heigth="200px" width="200px" src="<%=photo%>"><br>
<input type="hidden" name="photo" value='<%= r.getString("photo") %>'><br>
Item name: <input name="item_name" placeholder="Item name" value='<%= r.getString("item_name") %>' maxlength=40 required><br>
Mrp Price: <input value='<%= r.getInt("price") %>' name="price" type="number" step="any" min="0" oninput="check(this)" placeholder="Price"  required> <br>
Discount: <input value='<%= r.getString("discount") %>' name="discount" type="number" step="any" min="0" oninput="check(this)" placeholder="Discount" required><br>
 <br>
<p>description of project:</p>
         <textarea  name="description" rows=15 cols=15 required><%=r.getString("description")%></textarea><br><br>
       <%
}
     %>    
      <%
         String bb="yes";
         System.out.println(request.getParameter("cloth"));
         if(request.getParameter("cloth").equals(bb))
         {
        	 System.out.println("enter");
        	 %>
        	 <p><b>Update Stock Size_Wise(Max 10 items Per size)</b></p>
 UpperWear: <b>S</b>/Waist: <b>28</b>/Footwear :<b>7</b>:<select name="s">
  <option value="0">0
  <option value="1">1
  <option value="2">2
  <option value="3">3
  <option value="4">4
  <option value="5">5
  <option value="6">6
  <option value="7">7
  <option value="8">8
  <option value="9">9
  <option value="10">10
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
  UpperWear: <b>M</b>/Waist: <b>30</b>/Footwear :<b>8</b>:<select name="m">
  <option value="0">0
  <option value="1">1
  <option value="2">2
  <option value="3">3
  <option value="4">4
  <option value="5">5
  <option value="6">6
  <option value="7">7
  <option value="8">8
  <option value="9">9
  <option value="10">10
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
  UpperWear: <b>L</b>/Waist: <b>32</b>/Footwear :<b>9</b>:<select name="l">
  <option value="0">0
  <option value="1">1
  <option value="2">2
  <option value="3">3
  <option value="4">4
  <option value="5">5
  <option value="6">6
  <option value="7">7
  <option value="8">8
  <option value="9">9
  <option value="10">10
  </select>&nbsp;&nbsp;&nbsp;&nbsp;<br>
  UpperWear: <b>XL</b>/Waist: <b>34</b>/Footwear :<b>10</b>:<select name="xl">
  <option value="0">0
  <option value="1">1
  <option value="2">2
  <option value="3">3
  <option value="4">4
  <option value="5">5
  <option value="6">6
  <option value="7">7
  <option value="8">8
  <option value="9">9
  <option value="10">10
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
 UpperWear: <b>XXL</b>/Waist: <b>36</b>/Footwear :<b>11</b>:<select name="xxl">
  <option value="0">0
  <option value="1">1
  <option value="2">2
  <option value="3">3
  <option value="4">4
  <option value="5">5
  <option value="6">6
  <option value="7">7
  <option value="8">8
  <option value="9">9
  <option value="10">10
  </select><br><br>
     	 <% 
         }else
         {
         %>
         Stock: <input  value='<%= st %>' name="stock" type="number" step="any" min="0" oninput="check(this)" placeholder="no. of Availability" >
<%} %>
  <input name="cloth" value=<%= request.getParameter("cloth")%> type="hidden" >      
     <input type="submit">&nbsp;&nbsp;&nbsp;
<a href="seller_after_log.jsp"><button>Back</button></a>
</form>
<script>
 function check(input) {
   if (input.value <= 0) {
     input.setCustomValidity('The number must be positive.');
   } else {
     // input is fine -- reset the error message
     input.setCustomValidity('');
   }
 }
</script>
</body>
</html>
