package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;


@WebServlet("/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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

		
		String catid= (String)req.getParameter("catid");
		System.out.println(catid);
		
		if(catid!=null) {
			try {
				if(AdminDao.deleteCategory(catid)) {
					req.getSession().setAttribute("msg", "Category Deleted..!!");
					resp.sendRedirect("category.jsp");
					
				}
				else {
					req.getSession().setAttribute("msg", "Try after sometime..!!");
					resp.sendRedirect("category.jsp");
				}
				
			}
			catch(Exception ex) {
				System.err.println("Error "+ex.getMessage());
			}
		}
	
	}

	

}
