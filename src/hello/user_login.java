package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user_login")
public class user_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		String user=request.getParameter("id");
		String pass=request.getParameter("pass");
		//System.out.println(user+" "+pass);
		response.setContentType("text/html");
		//System.out.println(name+" "+id+" "+pass+" "+pet);
		new_database obj=new new_database();
		boolean check=obj.already_id_presentwithpass(user,pass,1); // 1 for verify user
		PrintWriter out=response.getWriter();
		if(check==true)
		{
			HttpSession s=request.getSession();
			s.setAttribute("id", user);
			s.setAttribute("search_item", "");
			 RequestDispatcher rd=request.getRequestDispatcher("show_products.jsp");  
		     rd.forward(request, response);
		}
		else
		{
			
			out.println("invalid Login details ...Try again");
			 RequestDispatcher rd=request.getRequestDispatcher("user_login.jsp");  
		     rd.include(request, response);
		}

	}

}
