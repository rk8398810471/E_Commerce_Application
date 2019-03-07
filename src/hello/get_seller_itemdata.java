package hello;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.catalina.Session;



@MultipartConfig(
		maxFileSize= 1024*1024*5,
		fileSizeThreshold=1024*1024*5,
		maxRequestSize=1024*1024*5
		)
@WebServlet("/get_seller_itemdata")
public class get_seller_itemdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	private String extractFileName(Part part)
	{
		String d="flag";
		 String c = part.getHeader("content-disposition");
		 //c= form-data; name="file"; filename="IMG-20161006-WA0027.jpg"
		// System.out.println(c+"\n");
	            if (c.contains("filename")) {
	                return c.substring(c.lastIndexOf("=") + 2, c.length()-1);
		}
	
	return d;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		new_database obj=new new_database();
		String id=request.getParameter("id");
		String item_name=request.getParameter("item_name");
		int price=Integer.parseInt(request.getParameter("price"));
		String discount=request.getParameter("discount");
		
		String description=request.getParameter("description");
		String cloth=request.getParameter("cloth");
		String t="true";
		
		
		
		response.setContentType("text/html");
		
		String savePath = "C:\\Users\\rajat\\eclipse-workspace\\E-commerce_project\\WebContent\\images";
		String f="C:\\Users\\rajat\\eclipse-workspace\\E-commerce_project\\WebContent";
		
		String fileName="";
		File dd = new File(f);
		File fileSaveDir = new File(savePath);
        for (Part part : request.getParts()) {
        	 fileName = extractFileName(part);  // photo
            if(fileName!="flag") // because parts multiple ja re hai ....jo debug krke dekha tha
            {
        //    	System.out.println(fileName);
            part.write(fileSaveDir + File.separator + fileName);
            part.write(dd + File.separator + fileName);
            PrintWriter p=response.getWriter();
            
           // request.setAttribute("id",id);
            /*RequestDispatcher rd=request.getRequestDispatcher("/seller_after_login.jsp");  
            rd.include(request, response);*/
            
            }
        }
        	
       
        //System.out.println(id+" "+item_name+" "+price+"\ "+discount+" "+stock+" "+description+" "+fileName);
        if(obj.item_already_present(id,fileName)) {
        	PrintWriter out=response.getWriter();
        	out.println("You have already Entered this item ");
        	RequestDispatcher rd=request.getRequestDispatcher("seller_add.jsp");  
            rd.include(request, response);
        }
        else
        {
        	String stock=null;
        	String j="no";
        	 if(cloth.equals(t) )
 			{
        		
 				String s=request.getParameter("s");
 				String m=request.getParameter("m");
 				String l=request.getParameter("l");
 				String xl=request.getParameter("xl");
 				String xxl=request.getParameter("xxl");
 				obj.add_sizes(id,fileName,s,m,l,xl,xxl);
 				j="yes";
 			}
        	 else
        		 stock=request.getParameter("stock");
        	
		obj.add_seller_data(id,item_name,price,discount,stock,description,fileName,j);
		
		RequestDispatcher rd=request.getRequestDispatcher("seller_after_log.jsp");  
        rd.forward(request, response);
        }
		
	}

}
