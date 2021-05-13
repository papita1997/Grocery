package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDao;
import pojo.ShopProductPojo;

@WebServlet("/ShopControllerServlet")
public class ShopControllerServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String prodId = (String) req.getParameter("data");
		System.out.println("prodId"+prodId);
		if(!prodId.isEmpty()) {
			HttpSession ses = req.getSession();
			try {
				
				ShopProductPojo shop = ProductDao.getShopProduct(prodId.trim());
				
				Map<String,String> gramUnits = ProductDao.getGramUnit();
				String name = gramUnits.get(shop.getUnitId());
				System.out.println("name"+name);
				if(name!=null) {
					ses.setAttribute("units", "gram");
				}
				else {
					ses.setAttribute("units","liter");
				}
				System.out.println("controller "+shop.getCatname());
				ses.setAttribute("shop",shop);
				resp.getWriter().print("shop_details.jsp");
				
			}
			catch(NullPointerException n) {
				ses.setAttribute("units","liter");
				resp.getWriter().print("shop_details.jsp");
			}
			catch(Exception ex) {
				System.out.println("some problem in DB");
			}
		}
		
	}

}
