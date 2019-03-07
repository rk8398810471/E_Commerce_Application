<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %>
    <%@page import="hello.*" %>
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
String s=(String)f.getAttribute("city");
%>

<form action="pincode_check.jsp">
<%if(s==null){ %> 
Pincode: <input  name="pincode" placeholder="zipcode...."  maxlength=6 minlength=6 step="any"  oninput="check(this)"  required>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="check"><br>
 <%}else{ %>
Pincode: <input value="<%= (String)f.getAttribute("pincode") %>" maxlength=6 minlength=6 name="pincode" placeholder="zipcode...."  step="any" min="0" oninput="check(this)" required>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="check"> Delivery available<br>
<%= f.getAttribute("city") %> 
 <%} %>
 </form>
<form action="save_address.jsp">
Name: <input name="name" placeholder="Name here...." maxlength=20 required><br>
Email_id: <input name="email" type="email" placeholder="email box...." maxlength=50 required><br>
Mobile: <input name="mobile" placeholder="10 digit mobile...." maxlength=10 minlength=10 onkeypress="return isNumberKey(event)" required><br>
Address: <br><textarea rows="15" cols="15" name="address" maxlength=400 required></textarea><br>
<input type="submit" value="continue"><br>

</form>


<script>
 function check(input) {
   if (input.value <= 0) {
     input.setCustomValidity('The number must be positive.');
   } else {
     input.setCustomValidity('');
   }
 }
 
 function isNumberKey(evt){
	    var charCode = (evt.which) ? evt.which : event.keyCode
	    if (charCode > 31 && (charCode < 48 || charCode > 57))
	        return false;
	    return true;
	}

	
</script>
</body>
</html>