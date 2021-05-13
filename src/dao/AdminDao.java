package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import dbutils.DBConnection;
import pojo.AdminProductPojo;
import pojo.CategoryPojo;
import pojo.OrderListPojo;


public class AdminDao {
		
	private static PreparedStatement ps,ps1,ps2,ps3,ps4,ps5,ps6,ps7,ps8,ps9;
	private static Statement st1,st2,st3;
	
	//private static Connection con=DBConnection.connect();
	
	static {
		try {
			Connection conn=DBConnection.connect();
			st1=conn.createStatement();
			st2=conn.createStatement();
			st3=conn.createStatement();
			ps=conn.prepareStatement("insert into category values(?,?)");
			ps1=conn.prepareStatement("delete from product where prod_id=?");
			ps2=conn.prepareStatement("delete from category where cat_id=?");
			ps3=conn.prepareStatement("update category set cname=? where cat_id=?");
			ps4=conn.prepareStatement("select cat_id,cname from category where cat_id=?");
			ps5=conn.prepareStatement("select product.prod_id,Pd_name,mrp,disc,tprice,description,img1,is_avi,cat_id from product,images where product.prod_id=images.prod_id and product.prod_id=?");
			ps6=conn.prepareStatement("update product set pd_name=?,mrp=?,disc=?,tprice=?,description=?,is_avi=?,cat_id=? where prod_id=?");
			ps7=conn.prepareStatement("update images set img1=? where prod_id=?");
			ps8=conn.prepareStatement("select img1 from images where prod_id=?");
			ps9=conn.prepareStatement("delete from images where prod_id=?");
			
		}
		catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
		}
		
	}
	
	/*** SHOW ADMIN ALL PRODUCTS ***/
	public static List<AdminProductPojo> getProductDetails() throws Exception{
		DBConnection.connect();
		List<AdminProductPojo> list= new ArrayList<>();
		
		ResultSet rs=st1.executeQuery("select * from product");
		while(rs.next()) {
			AdminProductPojo admin =new AdminProductPojo();
			admin.setProdId(rs.getString(1));
			admin.setProdName(rs.getString(2));
			admin.setMrp(rs.getInt(3));
			admin.setTotalPrice(rs.getInt(5));
			admin.setIs_avi(rs.getString(7));
			admin.setCat_id(rs.getString(8));

			list.add(admin);
			
		}
		Collections.sort(list,new Comparator<AdminProductPojo>() {

			@Override
			public int compare(AdminProductPojo o1, AdminProductPojo o2) {
				return o1.getProdId().compareToIgnoreCase(o2.getProdId());
			}

			
			
		});
		
		DBConnection.closeConnection();
		return list;
		
	}
	
	/***  SHOW ORDER LIST ***/
	public static List<OrderListPojo> getOrderDetails() throws Exception{
		DBConnection.connect();
		List<OrderListPojo> list = new ArrayList<>();
		ResultSet rs=st2.executeQuery("select purchase.pro_id,pd_name,userid,orderid,add_id from purchase,product where product.prod_id=purchase.pro_id");
		while(rs.next()) {
			OrderListPojo order=new OrderListPojo();
			order.setProductId(rs.getString(1));
			order.setProductName(rs.getString(2));
			order.setUserId(rs.getString(3));
			order.setOrderId(rs.getString(4));
			order.setAddId(rs.getString(5));
			
			list.add(order);
			
			
		}
		Collections.sort(list,new Comparator<OrderListPojo>() {

			@Override
			public int compare(OrderListPojo o1, OrderListPojo o2) {
				return o1.getOrderId().compareToIgnoreCase(o2.getOrderId());
			}
			
		});
		DBConnection.closeConnection();
		return list;
		
	}
	
	/*** GET NEW CATEGORYID ***/
	public static String getNewCategoryId() throws Exception{
		DBConnection.connect();
			ResultSet rs = st3.executeQuery("select max(cat_id) from category");
			int id=1;
	        if(rs.next()){
	            String cid=rs.getString(1);
	            int cno=Integer.parseInt(cid.substring(1));
	            id=id+cno;
	            DBConnection.closeConnection();
	            return "c"+id;
	        }
	        else{
	        	DBConnection.closeConnection();
	            return "c101";
	        }
			
	}
	
	/*** INSERT INTO CATEGORY ***/
	public static boolean insertCategory(CategoryPojo cat) throws Exception{
		DBConnection.connect();
		ps.setString(1, cat.getCatId());
		ps.setString(2, cat.getcName());
		int rs=ps.executeUpdate();
		DBConnection.closeConnection();
		return rs>0;
	
	}
	
	/***  DELETE FORM ALLPRODUCT BY PRODID***/
	public static boolean deleteProduct(String prod_id) throws Exception{
		Connection conn = DBConnection.connect();
		conn.setAutoCommit(false);
		ps1.setString(1, prod_id);
		int rs=ps1.executeUpdate();
		ps9.setString(1,prod_id);
		int rs2=ps9.executeUpdate();
		if(rs>0&&rs2>0) {
			conn.commit();
			conn.close();
			return true;
		}
		else {
			conn.rollback();
			conn.close();
			return false;
		}
		
	}
	
	/***  DELETE FORM CATEGORY BY CATID***/
	public static boolean deleteCategory(String cat_id) throws Exception{
		DBConnection.connect();
		ps2.setString(1, cat_id);
		int rs=ps2.executeUpdate();
		DBConnection.closeConnection();
		return rs>0;
		
	}
	
	/*** 	UPDATE CATEGORY BY CATID ***/ 
	public static boolean updateCategory(CategoryPojo cat) throws Exception{
		DBConnection.connect();
		ps3.setString(1, cat.getcName());
		ps3.setString(2, cat.getCatId());
		
		int rs=ps3.executeUpdate();
		
		DBConnection.closeConnection();
		return rs>0;
	}
	
	
	/*** GET CATEGORY BY CATID ***/ 
	public static CategoryPojo CategoryById(String cat_id) throws Exception{
		DBConnection.connect();
		ps4.setString(1, cat_id);
		CategoryPojo cat=new CategoryPojo();
		ResultSet rs=ps4.executeQuery();
		if(rs.next()) {
			cat.setCatId(rs.getString(1));
			cat.setcName(rs.getString(2));
		}
		DBConnection.closeConnection();
		return cat;
	}
	/*** GET PRODUCT BY PRODID ***/
	public static AdminProductPojo ProductById(String prod_id) throws Exception{
		DBConnection.connect();
		ps5.setString(1, prod_id);
		AdminProductPojo admin=new AdminProductPojo();
		ResultSet rs=ps5.executeQuery();
		if(rs.next()) {
			admin.setProdId(rs.getString(1));
			admin.setProdName(rs.getString(2));
			admin.setMrp(rs.getInt(3));
			admin.setDiscount(rs.getInt(4));
			admin.setTotalPrice(rs.getInt(5));
			admin.setDescription(rs.getString(6));
			admin.setProdImages(rs.getString(7));
			admin.setIs_avi(rs.getString(8));
			admin.setCat_id(rs.getString(9));
			
		}
		DBConnection.closeConnection();
		return admin;
		
	}
	
	/*** UPDATE ADDPRODUCT TABLE ***/
	public static boolean UpdateProductAndImage(AdminProductPojo prod) throws Exception{
		DBConnection.connect();
		
		ps6.setString(1,prod.getProdName());
		ps6.setInt(2,prod.getMrp());
		ps6.setInt(3,prod.getDiscount());
		ps6.setInt(4,prod.getTotalPrice());
		ps6.setString(5,prod.getDescription());
		ps6.setString(6,prod.getIs_avi());
		ps6.setString(7,prod.getCat_id());
		ps6.setString(8,prod.getProdId());
		
		ps7.setString(2, prod.getProdId());
		ps7.setString(1,prod.getProdImages());
		
		int Result1 = ps6.executeUpdate();
		int Result2 = ps7.executeUpdate();
		
		Connection conn = DBConnection.connect();
		conn.setAutoCommit(false);
		if(Result1>0 && Result2>0) {
			conn.commit();
			DBConnection.closeConnection();
			return true;
		} else {
			conn.rollback();
			DBConnection.closeConnection();
			return false;
		}
		
	}
	
	/*** GETTING IMAGE THROUGH PRODUCT ID ***/
	public static String getImage(String prod_id) throws SQLException{
		DBConnection.connect();
		ps8.setString(1, prod_id);
		ResultSet rs = ps8.executeQuery();
		String name = "";
		if(rs.next()) {
			name = rs.getString(1);
		}
		DBConnection.closeConnection();
		return name;
	}
	
	
	
	
}
