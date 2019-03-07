package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user_forgot")
public class user_forgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String id=request.getParameter("id");
String pet=request.getParameter("pet");
PrintWriter out=response.getWriter();
response.setContentType("text/html");
//System.out.println(name+" "+id+" "+pass+" "+pet);
new_database obj=new new_database();
boolean check=obj.already_id_presentwithpet(id,pet,1);

if(check==true)
{
	String pass=obj.get_pass(id,1);
	out.println("<h2>password is: "+pass+"</h2><br>");
	 RequestDispatcher rd=request.getRequestDispatcher("/get_forgot_pass.html");  
     rd.include(request, response);
}
else
{
	out.println("Details are incorrect");
	 RequestDispatcher rd=request.getRequestDispatcher("/user_forgot.html");  
     rd.include(request, response);
}

	}

}
