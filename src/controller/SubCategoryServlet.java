package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDao;
import pojo.SubCategoryPojo;


@WebServlet("/showcategoryProd")
public class SubCategoryServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cat_id= (String)req.getParameter("cat");
		System.out.println(cat_id);
		if(cat_id!=null) {
			try {
				HttpSession session=req.getSession();
				List<SubCategoryPojo> subrand=ProductDao.getSubCategoryRand(cat_id);
				session.setAttribute("subrand", subrand );
				List<SubCategoryPojo> sub=ProductDao.getSubCategoryAll(cat_id);
				session.setAttribute("suball", sub);
				session.setAttribute("cat_id", cat_id);
				resp.sendRedirect("shop_grid.jsp");
				
			}
			catch(Exception ex) {
				System.err.println("Error "+ex.getMessage());
			}
		}
	
	
	}

	
}
