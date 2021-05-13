package controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;

@WebServlet("/validate")
public class LoginController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid=req.getParameter("email");
		String password=req.getParameter("password");
		HttpSession session=req.getSession();
		try {
			List<String> result = LoginDao.validateUser(userid, password);
			System.out.println("result"+result);
			if(result.isEmpty()) {
				System.out.println(result);
				session.setAttribute("invalid", "Invalid UserID & Password");
				resp.sendRedirect("login.jsp");
				return;
			}
			
				session.setAttribute("userid",userid);
				session.setAttribute("username",result.get(0));
				session.setAttribute("type", result.get(1));
				if(result.get(1).equals("USER")) {
					resp.sendRedirect("home.jsp");
				}else {
					resp.sendRedirect("admin.jsp");
				}
					
		}
		catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
		}
		
	}
}
