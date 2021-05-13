package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HomeDao;
import pojo.SubCategoryPojo;


@WebServlet("/SearchBarServlet")
public class SearchBarServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search=(String) req.getParameter("search");
		if(search!=null) {
			
			try {
				
				List<SubCategoryPojo> sub=HomeDao.SearchButton(search);
				List<SubCategoryPojo> subrand=HomeDao.getSearchRand();
				req.getSession().setAttribute("subrand", subrand );
				req.getSession().setAttribute("suball", sub);
				resp.sendRedirect("shop_grid.jsp");
				
			}
				catch(Exception ex)	{
					System.err.println("Error "+ex.getMessage());
				}
		}
	
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String str=(String)req.getParameter("data");
		if(str!= null) {
			try {
				
				HashMap<String,String> map=HomeDao.Suggestions(str);				//%a%
				
				String pid ="";
				String pname ="";
				for(String s:map.keySet()) {							//{p101:mango,p102:apple,p103:orei}
					pid = pid+s+",";									// "p101,p102,p103,"
					pname = pname+map.get(s)+","; 						//"mango,apple,orei,"
				}
				resp.getWriter().print(pid+":"+pname);					//"p101,p102,p103,:mango,apple,orei,"
			}
			catch(Exception ex) {
				System.err.println("Error "+ex.getMessage());
			}
		}
		
	}

}
