package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;

/**
 * Servlet implementation class CancelOrderServlet
 */
@WebServlet("/CancelOrder")
public class CancelOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pid = (String)request.getParameter("pid");
		String orderid = (String)request.getParameter("orderid");
		
		try {
			
			boolean Result =ProductDao.deleteFromPurchase(pid, orderid);
			if(Result) {
				resp.sendRedirect("orderPlaced.jsp");
			}
			else {
				
				resp.sendRedirect("orderPlaced.jsp");
			}
			
		}
		catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
		}
	}

}
