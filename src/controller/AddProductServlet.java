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

import dao.ProductDao;
import pojo.AdminProductPojo;


@WebServlet("/addproduct")
public class AddProductServlet extends HttpServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String u=(String)req.getSession().getAttribute("userid");
		String t = (String)req.getSession().getAttribute("type");
		System.out.println(t);
		if(u!=null && t!=null){
			if(!u.equalsIgnoreCase("admin@gmail.com") || !t.equals("ADMIN")){
				resp.sendRedirect("accessdenied.html");
				return;
			}
		}else{
			resp.sendRedirect("accessdenied.html");
		}

		
		try {
			
			DiskFileItemFactory dif=new DiskFileItemFactory();
	           ServletRequestContext srq=new ServletRequestContext(req);
	           ServletFileUpload sfu=new ServletFileUpload(dif);
	           List<FileItem> multiparts=sfu.parseRequest(srq);
	           ArrayList<String> formfield=new ArrayList<>();
	           InputStream fileContent=null;
	           InputStream in=null;
	           String imagname = "";
	           for(FileItem item:multiparts){
	               if(!item.isFormField()){
	            	   fileContent=item.getInputStream();
	            	   in = item.getInputStream();
	            	    imagname = item.getName(); 
	               }else {
	            	   String fieldValue=item.getString();
	                   formfield.add(fieldValue);
	               }
	           }
	           
	           if(formfield.get(0).equals("--select category--")) {
		 			resp.sendRedirect("AddProduct.jsp");
		 			return;
		 			}  
	           
	         ServletContext sc = req.getServletContext();
	         File f = new File(sc.getRealPath("images")+"\\product");
	         //System.out.println(sc.getRealPath("images")+"\\product");
	         if(!f.isDirectory()) {
	        	 System.out.println("this runs");
	        	boolean make = f.mkdirs();
	        	System.out.println(make);
	         }
   
	         FileOutputStream out = new FileOutputStream(f.getAbsolutePath()+"\\"+imagname); 
	         System.out.println(f.getAbsolutePath());
	         ByteArrayOutputStream buffer = new ByteArrayOutputStream();
	         System.out.println(in.read());
	         //System.out.println(fileContent.);
	         long start = System.currentTimeMillis();
	         int nRead;
	         byte[] data = new byte[16384];
	        
	         while ((nRead = fileContent.read(data, 0, data.length)) != -1) {
	           buffer.write(data, 0, nRead);
	          
	         }
	         //System.out.println((read/16384)*100);
	         long end = System.currentTimeMillis();
	         System.out.println(end-start);
	         out.write(buffer.toByteArray());
	         out.close();
	        
	     AdminProductPojo prod=new AdminProductPojo();
	    
	     		try {
		 		if(formfield.get(7).isEmpty()) {
		 			prod.setIs_avi("no");
		 		} else {
		 			prod.setIs_avi(formfield.get(7));
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
		prod.setProdImages("images/product/"+imagname);
		
		boolean result = ProductDao.AddProductAndImage(prod);
		if(result)
		{
			req.getSession().setAttribute("msg", "Product Successfully Uploaded..!!");
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
