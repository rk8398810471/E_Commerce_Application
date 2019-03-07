package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class seller_forgot
 */
@WebServlet("/seller_forgot")
public class seller_forgot extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method s
		String id=request.getParameter("id");
		String pet=request.getParameter("pet");
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		//System.out.println(name+" "+id+" "+pass+" "+pet);
		new_database obj=new new_database();
		boolean check=obj.already_id_presentwithpet(id,pet,2);

		if(check==true)
		{
			String pass=obj.get_pass(id,2);
			out.println("<h2>password is: "+pass+"</h2><br>");
			 RequestDispatcher rd=request.getRequestDispatcher("/get_seller_forgot_password.html");  
		     rd.include(request, response);
		}
		else
		{
			out.println("Details are incorrect");
			 RequestDispatcher rd=request.getRequestDispatcher("/seller_forgot.html");  
		     rd.include(request, response);
		}

	}

}
