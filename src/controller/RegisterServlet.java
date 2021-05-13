package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;
import dao.RegisterDao;
import pojo.UserPojo;


@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
   
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override   
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		String password=req.getParameter("password");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String repassword=req.getParameter("repassword");
		
		HttpSession session=req.getSession();
		
		if(password.equals(repassword)) {
			UserPojo user=new UserPojo();
			user.setUserid(email);
			user.setPassword(password);
			user.setPhone_no(phone);
			user.setUsername(name);
			try {
			boolean Result = RegisterDao.register(user);
			if(Result){
				
				String uname=LoginDao.validateUser1(email, password);
				session.setAttribute("username", uname);
				resp.sendRedirect("home.jsp");
				}
			
			}
			catch(Exception ex) {
				System.err.println("error "+ex.getMessage());
			}
		}
		else {
			
			session.setAttribute("masgs", "Password mismatched..!!");
			resp.sendRedirect("register.jsp");
		}
		
				
	}

}
