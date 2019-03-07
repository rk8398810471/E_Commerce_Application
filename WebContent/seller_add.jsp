<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<center>
<form action="Logout" method="post">
<input type="submit" value="logout">
</form></center>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
 response.setHeader("Expires","0");
HttpSession h=request.getSession();
if(h.getAttribute("username")==null)
{
	response.sendRedirect("seller_login.jsp");
}
%>

<%! String g; %>
<%
HttpSession hs=request.getSession();
g=(String)hs.getAttribute("username");

%>

<form  action="get_seller_item" method="post" enctype="multipart/form-data">
 Seller id: <input name="id" value="<%=g%>" readonly><br>     
Item name: <input name="item_name" placeholder="Item name" maxlength=40 required><br>
Mrp Price: <input  name="price" type="number" step="any"  min="0" oninput="check(this)" placeholder="Price"  required> <br>
Discount: <input name="discount" type="number" step="any" min="0" oninput="check(this)" placeholder="Discount" required><br>
 <br>


<br>
<p>description of project:</p>
         <textarea name="description" rows=15 maxlength=40 cols=15 required>Enter Decription of product
         </textarea><br><br>
       
         <br>
         <%
         String bb="true";
         System.out.println(request.getParameter("clothes"));
         if(request.getParameter("clothes").equals(bb))
         {
        	 System.out.println("enter");
        	 %>
        	 <p><b>Enter Stock Size_Wise(Max 10 items Per size)</b></p>
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
         Stock: <input name="stock" type="number" step="any" min="0" oninput="check(this)" placeholder="no. of Availability" required>
         
         <%} %>
  <input name="cloth" value=<%= request.getParameter("clothes")%> type="hidden" >      
         item photo:<input type="file" name="photo"  required><br>
          
  <input type="submit"  />&nbsp;&nbsp;&nbsp;
<a href="cloth_other_product.jsp"><input type="button" value="back"></input></a>
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