package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HomeDao;
import pojo.BasketPojo;


@WebServlet("/DeleteCartServlet")
public class DeleteCartServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String prodid=(String)req.getParameter("data");
		HttpSession session=req.getSession();
		String userid=(String)session.getAttribute("userid");
		if(prodid!= null && userid!= null) {
			BasketPojo basket=new BasketPojo();
			basket.setProductID(prodid);
			basket.setUserId(userid);
			try {
				boolean Result =HomeDao.DeleteFromCart(basket);
				if(Result) {
					resp.getWriter().print("Removed..!!");
					
				}
				else {
					resp.getWriter().println("Try After Sometime..!!");
				}
			}
			catch(Exception ex) {
				System.err.println("Error"+ex.getMessage());
			}
			
		}
	}

}
