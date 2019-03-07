package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user_signup")
public class user_signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String pet=request.getParameter("pet");
	PrintWriter out=response.getWriter();
	response.setContentType("text/html");
//	System.out.println(name+" "+id+" "+pass+" "+pet);
	new_database obj=new new_database();
	boolean check=obj.already_id_present(id,1);
	if(check==false)
	{
		obj.add_user_data(name,id,pass,pet,"no tension",1);
		 out.println("successfully inserted......now you can Login");
		 RequestDispatcher rd=request.getRequestDispatcher("user_login.jsp");  
	        rd.include(request, response);
	}
	else
	{
		 out.println("Sorry Id already registered.....");  
	        RequestDispatcher rd=request.getRequestDispatcher("/user_signup.html");  
	        rd.include(request, response);
	}
	
	
	}

}
