package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import pojo.CategoryPojo;


@WebServlet("/EditCategory")
public class EditCategoryServlet extends HttpServlet {
	
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

		
		String cat_id =(String)req.getParameter("catid");
		System.out.println("edit "+cat_id);
		if(cat_id!=null) {
			try {
				CategoryPojo cat= AdminDao.CategoryById(cat_id);
				req.getSession().setAttribute("cat", cat);
				resp.sendRedirect("category.jsp");
				
			}catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());	
			}
		}

	}

	
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

		
		String cat_id =(String)req.getParameter("catid");
		String cname =(String)req.getParameter("cname");
		
		if(cat_id!=null && cname!=null) {
			try {
				if(AdminDao.updateCategory(new CategoryPojo(cat_id,cname))) {
					req.getSession().setAttribute("msg", "Category Updated..!!");
					resp.sendRedirect("category.jsp");
				}
				else {
					req.getSession().setAttribute("msg", "Try after Sometime..!!");
					resp.sendRedirect("category.jsp");
				}
				
				
			}catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());	
			}
			
		}
		else {
			req.getSession().setAttribute("msg", "First Select Category..!!");
			resp.sendRedirect("category.jsp");
		}
	}

}
