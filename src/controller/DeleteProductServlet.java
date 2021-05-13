package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;

@WebServlet("/DeletProductServlet")
public class DeleteProductServlet extends HttpServlet {
	
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

		
		String prodid= (String)req.getParameter("pid");
		System.out.println(prodid);
		
		if(prodid!=null) {
			try {
				String image = AdminDao.getImage(prodid);
				String imagname = image.substring(image.lastIndexOf("/")+1,image.length());
				ServletContext sc = req.getServletContext();
				File f = new File(sc.getRealPath("images")+"\\product\\"+imagname);
				System.out.println(f.getAbsolutePath());
				boolean filedelete = false;
					filedelete = f.delete();
					System.out.println(filedelete);
				if(filedelete) {				
					if(AdminDao.deleteProduct(prodid)) {
						req.getSession().setAttribute("msg", "Product Deleted..!!");
						resp.sendRedirect("AllProduct.jsp");
					}
					else {
						req.getSession().setAttribute("msg", "Try after sometime..!!");
						resp.sendRedirect("AllProduct.jsp");	
					}
					
				}
				else {
					req.getSession().setAttribute("msg", "product Image in not available..!!");
					resp.sendRedirect("AllProduct.jsp");
				}
				
			}
			catch(Exception ex) {
				System.err.println("Error "+ex.getMessage());
				ex.printStackTrace();
			}
		}
	
	}

	

}
