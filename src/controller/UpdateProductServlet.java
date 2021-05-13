package controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import dao.AdminDao;
import pojo.AdminProductPojo;

@WebServlet("/updateproduct")
public class UpdateProductServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String u=(String)req.getSession().getAttribute("userid");
		String t = (String)req.getSession().getAttribute("type");
		if(u!=null && t!=null){
			if(!u.equalsIgnoreCase("admin@gmail.com") || !t.equals("ADMIN")){
				resp.sendRedirect("accessdenied.html");
				return;
			}
		}else{
			resp.sendRedirect("accessdenied.html");
			return;
		}

		
		String prod_id = (String)req.getParameter("pid");
		
		try {
			AdminProductPojo admin=AdminDao.ProductById(prod_id);
			req.getSession().setAttribute("admin", admin);
			resp.sendRedirect("editproduct.jsp");
		}
		catch(Exception ex)
		{
			System.err.println("Error"+ex.getMessage());
		}
		
		
	
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String u=(String)req.getSession().getAttribute("userid");
		String t = (String)req.getSession().getAttribute("type");
		if(u!=null && t!=null){
			if(!u.equalsIgnoreCase("admin@gmail.com") || !t.equals("ADMIN")){
				resp.sendRedirect("accessdenied.html");
				return;
			}
		}else{
			resp.sendRedirect("accessdenied.html");
			return;
		}

		
		try {
			
			DiskFileItemFactory dif=new DiskFileItemFactory();
	           ServletRequestContext srq=new ServletRequestContext(req);
	           ServletFileUpload sfu=new ServletFileUpload(dif);
	           List<FileItem> multiparts=sfu.parseRequest(srq);
	           ArrayList<String> formfield=new ArrayList<>();
	           InputStream fileContent=null;
	           String imagname = "";
	           for(FileItem item:multiparts){
	               if(!item.isFormField()){
	            	   fileContent=item.getInputStream();
	            	    imagname = item.getName();
	            	    System.out.println("imag"+fileContent);
	                   System.out.println("fileContent"+item.getName()); 
	               }else {
	            	   String fieldValue=item.getString();
	                   formfield.add(fieldValue);
	                   System.out.println("fieldvalues"+fieldValue);
	               }
	              
	           }
	           
	          AdminProductPojo prod=new AdminProductPojo();  
	          
	         if(!imagname.isEmpty()) {  
	         ServletContext sc = req.getServletContext();
	         File f = new File(sc.getRealPath("images")+"\\product");
	         System.out.println(sc.getRealPath("images")+"\\product");
	         if(!f.isDirectory()) {
	        	 System.out.println("this runs");
	        	boolean make = f.mkdirs();
	        	System.out.println(make);
	         	}
	         FileOutputStream out = new FileOutputStream(f.getAbsolutePath()+"\\"+imagname); 
	         System.out.println(f.getAbsolutePath());
	         ByteArrayOutputStream buffer = new ByteArrayOutputStream();

	         int nRead;
	         byte[] data = new byte[16384];

	         while ((nRead = fileContent.read(data, 0, data.length)) != -1) {
	           buffer.write(data, 0, nRead);
	         }
	         out.write(buffer.toByteArray());
	         out.close();
	         prod.setProdImages("images/product/"+imagname);
	         }
	         else {
	        	prod.setProdImages(formfield.get(7)); 
	         }
		
	         try {
	 		if(formfield.get(8).isEmpty()) {
	 			prod.setIs_avi("no");
	 		} else {
	 			prod.setIs_avi(formfield.get(8));
	 		}
	         } catch(IndexOutOfBoundsException index) {
	        	 prod.setIs_avi("no");
	         }
	 		
		prod.setProdId(formfield.get(1));
		prod.setCat_id(formfield.get(0));
		prod.setProdName(formfield.get(2));
		prod.setMrp(Integer.parseInt(formfield.get(3)));
		prod.setDiscount(Integer.parseInt(formfield.get(4)));
		prod.setTotalPrice(Integer.parseInt(formfield.get(5)));
		prod.setDescription(formfield.get(6));
		
		
		boolean result = AdminDao.UpdateProductAndImage(prod);
		if(result)
		{
			req.getSession().setAttribute("msg", "Product Successfully Updated..!!");
			resp.sendRedirect("AddProduct.jsp");
		}
		else {
			req.getSession().setAttribute("msg", "Try After Sometime..!!");
			resp.sendRedirect("AddProduct.jsp");
		}
		}
		catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
			ex.printStackTrace();
		}
	
	}
	
}
