<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


 <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  align: center;
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #3498DB;
}

.imgcontainer {

  text-align: center;
  margin: 24px 0 12px 0;
   
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
<body>

<h2>User Login Form</h2>
 <div class="imgcontainer">
    <img align="center" src="img_avatar2.png" width="250" height="250" alt="Avatar" >
  </div>
<form action="userlogin" method="post">
 

  <div class="container">
    <label for="uname"><b>Username</b></label>
    <input name="id" placeholder="ID" maxlength=20 type="text" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" name="pass" placeholder="Pass key" maxlength=20 required>
        
    <button type="submit">Login</button>
    
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <a href="user_signup.html"><input class="cancelbtn" type="button" name="signup" value="Signup" >
    <div align="right" class="psw"><a href="user_forgot.html">Forgot password?</a></div>
  </div>
</form>

</body>
</html>
 

