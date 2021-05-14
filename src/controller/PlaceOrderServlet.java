package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDao;
import pojo.BasketPojo;
import pojo.CheckOutPojo;


@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String prodid=(String)req.getParameter("pid");
		String prodidlist = (String)req.getParameter("pidlist");
		
		HttpSession session=req.getSession();
		String userid=(String) session.getAttribute("userid");
		if(userid ==null) {
			resp.sendRedirect("login.jsp");
			return;
			
		}
		if(prodid!=null || prodidlist!=null) {
			
			String fname=req.getParameter("fname");
			String lname=req.getParameter("lname");
			String country=req.getParameter("country");
			String address=req.getParameter("address");
			String town=req.getParameter("town");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String phone=req.getParameter("phone");
			String email=req.getParameter("email");
			
			CheckOutPojo check = new CheckOutPojo();
			
			check.setPro_Id(!prodid.equals("null")?prodid : prodidlist);
			check.setAddId("ADD"+System.currentTimeMillis());
			check.setFirstName(fname);
			check.setLastName(lname);
			check.setCountry(country);
			check.setAddress(address);
			check.setTown(town);
			check.setState(state);
			check.setPinCode(Integer.parseInt(pincode));
			check.setPhone(phone);
			check.setEmail(email);
			check.setQty(1);
			check.setOrderId("ORD"+System.currentTimeMillis());
			check.setUserid(userid);
			
			try {
				
				boolean Result =ProductDao.PlaceOrder(check);
				if(Result) {
					resp.sendRedirect("home.jsp");
				}
				else {
					
					resp.sendRedirect("checkout.jsp");
				}
				
			}
			catch(Exception ex) {
				System.err.println("Error "+ex.getMessage());
			}
		}
		
	}

}
