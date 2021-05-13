package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import pojo.CategoryPojo;


@WebServlet("/SaveCategory")
public class SaveCategoryServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String u=(String)req.getSession().getAttribute("userid");
		String t = (String)req.getSession().getAttribute("type");
		if(u!=null && t!=null){
			if(!u.equalsIgnoreCase("admin@gmail.com") || !t.equals("ADMIN")){
				resp.sendRedirect("accessdenied.html");
				return;
			}
		}else{
			resp.sendRedirect("accessdenied.html");
		}

		
		String cname=(String) req.getParameter("cname");
		
		if(cname!=null) {
			
			try {
				
				String catid=AdminDao.getNewCategoryId();
				if(AdminDao.insertCategory(new CategoryPojo(catid,cname))) {
					req.getSession().setAttribute("insertmsg", "Inserted Successfully..!!");
					resp.sendRedirect("category.jsp");
				}
				else {
					req.getSession().setAttribute("insertmsg", "Try After Sometime..!!");
					resp.sendRedirect("category.jsp");
				}
				
			}
			catch(Exception ex) {
				System.err.println("Error "+ex.getMessage());
			}
			
		}
		
		
	}

}
