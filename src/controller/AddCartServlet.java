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


@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
       
    
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String prodid=(String)req.getParameter("data");
		HttpSession session=req.getSession();
		String userid=(String)session.getAttribute("userid");
		
		System.out.println(userid);
		
		if(userid !=null &&  prodid !=null) {
			
			BasketPojo basket= new BasketPojo();
			basket.setUserId(userid);
			basket.setProductID(prodid);
			basket.setQuantity(1);
			
			try {
				
				boolean result=HomeDao.AddToCart(basket);
				if(result) {
					int count=HomeDao.CartCount(userid);
					resp.getWriter().print(String.valueOf(count)+":"+"true");
					
				} else {
					resp.getWriter().print("false");
				}
			}
			catch(Exception ex) {
				
			}
		}
		
		
	}

}
