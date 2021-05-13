package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbutils.DBConnection;
@WebServlet("/cpwd")
public class ChangePwd extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pwd=req.getParameter("pwd");
		String cpwd=req.getParameter("npwd");
		String nnpwd=req.getParameter("nnpwd");
		HttpSession session=req.getSession();
		String uname=(String) session.getAttribute("userid");
		try {
			Connection con=DBConnection.connect();
			String sql="select * from user where userid=? and password=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				sql="update user set password=? where userid=?";
				ps=con.prepareStatement(sql);
				ps.setString(2, uname);
				ps.setString(1, cpwd);
				ps.executeUpdate();
				resp.getWriter().println("password changed...");
			}
			else {
				resp.getWriter().println("Wrong password");
			}
		}
		catch(Exception e) {
			resp.getWriter().println(e.getMessage());
		}
	}
}
