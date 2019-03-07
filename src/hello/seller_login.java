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

/**
 * Servlet implementation class seller_login
 */
@WebServlet("/seller_login")
public class seller_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("id");
				String pass=request.getParameter("pass");
				
				
				
				//System.out.println(user+" "+pass);
				response.setContentType("text/html");
				//System.out.println(name+" "+id+" "+pass+" "+pet);
				new_database obj=new new_database();
				boolean check=obj.already_id_presentwithpass(user,pass,2); // 1 for verify user
				PrintWriter out=response.getWriter();
				if(check==true)
				{
					//request.setAttribute("id", user);
					HttpSession s=request.getSession();
					s.setAttribute("username", user);
					 RequestDispatcher rd=request.getRequestDispatcher("seller_after_log.jsp");  
				     rd.forward(request, response);
				}
				else
				{
					
					out.println("invalid Login details ...Try again");
					 RequestDispatcher rd=request.getRequestDispatcher("seller_login.jsp");  
				     rd.include(request, response);
				}

	}

}
