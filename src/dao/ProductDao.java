package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dbutils.DBConnection;
import global.GlobalData;
import pojo.AdminProductPojo;
import pojo.CheckOutPojo;
import pojo.OrdersPojo;
import pojo.ShopProductPojo;
import pojo.SubCategoryPojo;

public class ProductDao {
		private static Statement st,st1,st2;
		private static PreparedStatement ps,ps1,ps2,ps3,ps4,ps5,ps6,ps7,ps8,ps9;
		
	static {
		try {
			Connection conn = DBConnection.connect();
			st = conn.createStatement();
			st1=conn.createStatement();
			st2=conn.createStatement();
			ps=conn.prepareStatement("insert into product values(?,?,?,?,?,?,?,?)");
			ps1=conn.prepareStatement("insert into images values(?,?)");
			ps2=conn.prepareStatement("select product.prod_id,pd_name,tprice,description,is_avi,img1,cat_id from product,images where product.prod_id=? and product.prod_id=images.prod_id ");
			ps3=conn.prepareStatement("select product.prod_id,pd_name,cname,mrp,disc,tprice,img1 from product,category,images where product.prod_id=images.prod_id and product.cat_id =category.cat_id and category.cat_id =? ORDER BY RAND() LIMIT 5");
			ps4=conn.prepareStatement("select product.prod_id,pd_name,cname,mrp,disc,tprice,img1 from product,category,images where product.prod_id=images.prod_id and product.cat_id =category.cat_id and category.cat_id =? LIMIT 12");
			ps5=conn.prepareStatement("insert into address values(?,?,?,?,?,?,?,?,?,?)");
			ps6=conn.prepareStatement("insert into purchase values(?,?,?,?,?)");
			ps7=conn.prepareStatement("select prod_id, pd_name,mrp,disc,tprice from product where prod_id=?" );
			ps8=conn.prepareStatement("select product.prod_id,pd_name,tprice,description,img1,orderid from product,purchase,images where images.prod_id=product.prod_id and purchase.userid=? and product.prod_id=purchase.pro_id;");
			ps9 = conn.prepareStatement("delete from purchase where pro_id=? and orderid=?");
		}
		catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
		}
		
	}
	
	public static HashMap<String,String> getAllCategory() throws Exception{
		DBConnection.connect();
		ResultSet rs=st.executeQuery("select * from category");
		HashMap<String,String> map = new HashMap<>();
		
		while(rs.next()) {
			map.put(rs.getString(1), rs.getString(2));
		}
		
		DBConnection.closeConnection();
		return map;
	}
	
	
	public static String getNewProductId() throws Exception{
		DBConnection.connect();
			ResultSet rs = st1.executeQuery("select max(Prod_Id) from product");
			int id=1;
	        if(rs.next()){
	            String cid=rs.getString(1);
	            int cno=Integer.parseInt(cid.substring(1));
	            id=id+cno;
	            DBConnection.closeConnection();
	            return "p"+id;
	        }
	        else{
	        	DBConnection.closeConnection();
	            return "p101";
	        }
			
	}
	
	public static boolean AddProductAndImage(AdminProductPojo prod) throws Exception{
		DBConnection.connect();
		ps.setString(1,prod.getProdId());
		ps.setString(2,prod.getProdName());
		ps.setInt(3,prod.getMrp());
		ps.setInt(4,prod.getDiscount());
		ps.setInt(5,prod.getTotalPrice());
		ps.setString(6,prod.getDescription());
		ps.setString(7,prod.getIs_avi());
		ps.setString(8,prod.getCat_id());
		
		ps1.setString(1, prod.getProdId());
		ps1.setString(2,prod.getProdImages());
		
		int Result1 = ps.executeUpdate();
		int Result2 = ps1.executeUpdate();
		
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
	
	public static ShopProductPojo getShopProduct(String prodid) throws Exception{
		DBConnection.connect();
		ps2.setString(1, prodid);
		
		ResultSet rs = ps2.executeQuery();
		ShopProductPojo shop = new ShopProductPojo();
		HashMap<String,String> map = ProductDao.getAllCategory();
		if(rs.next()) {
			shop.setProductId(rs.getString(1));
			shop.setpName(rs.getString(2));
			shop.settPrice(rs.getInt(3));
			shop.setpDesc(rs.getString(4));
			shop.setIsAvi(rs.getString(5));
			shop.setpImage(rs.getString(6));
			shop.setCatname(map.get(rs.getString(7)));
		}
		shop.setUnitId("u101");
		DBConnection.closeConnection();
		return shop;
	}
	
	public static List<SubCategoryPojo> getSubCategoryRand(String cat_id) throws Exception{
		DBConnection.connect();
		ps3.setString(1, cat_id);
		ResultSet rs=ps3.executeQuery();
		List<SubCategoryPojo> list=new ArrayList<>();
		while(rs.next()) {
			SubCategoryPojo sub= new SubCategoryPojo();
			sub.setProductId(rs.getString(1));
			sub.setProductName(rs.getString(2));
			sub.setCatName(rs.getString(3));
			sub.setMrp(rs.getInt(4));
			sub.setDiscount(rs.getInt(5));
			sub.setTotalPrice(rs.getInt(6));
			sub.setImage(rs.getString(7));
			list.add(sub);
			
		}
		DBConnection.closeConnection();
		return list;
	}
	
	public static List<SubCategoryPojo> getSubCategoryAll(String cat_id) throws Exception{
		DBConnection.connect();
		ps4.setString(1, cat_id);
		ResultSet rs=ps4.executeQuery();
		List<SubCategoryPojo> list=new ArrayList<>();
		while(rs.next()) {
			SubCategoryPojo sub= new SubCategoryPojo();
			sub.setProductId(rs.getString(1));
			sub.setProductName(rs.getString(2));
			sub.setCatName(rs.getString(3));
			sub.setMrp(rs.getInt(4));
			sub.setDiscount(rs.getInt(5));
			sub.setTotalPrice(rs.getInt(6));
			sub.setImage(rs.getString(7));
			list.add(sub);
			
		}
		DBConnection.closeConnection();
		return list;
	}
	
	public static boolean PlaceOrder(List<CheckOutPojo> checks) throws Exception {
		
		Connection conn=DBConnection.connect();
		for(CheckOutPojo check:checks) {
		ps5.setString(1, check.getAddId());
		ps5.setString(2, check.getFirstName());
		ps5.setString(3, check.getLastName());
		ps5.setString(4,check.getCountry());
		ps5.setString(5,check.getAddress());
		ps5.setString(6,check.getTown());
		ps5.setString(7,check.getState());
		ps5.setInt(8 ,check.getPinCode());
		ps5.setString(9,check.getPhone());
		ps5.setString(10,check.getEmail());
		ps5.addBatch();
		}
		int[] add =ps5.executeBatch();
		for(CheckOutPojo check:checks) {
		ps6.setString(1, check.getPro_Id());
		ps6.setInt(2, check.getQty());
		ps6.setString(3, check.getAddId());
		ps6.setString(4, check.getUserid());
		ps6.setString(5, check.getOrderId());
		ps6.addBatch();
		}
		int[] pur=ps6.executeBatch();
		conn.setAutoCommit(false);
		if(add.length>0 && pur.length>0) {
			conn.commit();
			conn.close();
			return true;
			
		}else {
			conn.rollback();
			conn.close();
			return false;
		}
	}
	
	public static SubCategoryPojo CheckOutProduct(String Prod_id) throws Exception{
		DBConnection.connect();
		ps7.setString(1, Prod_id);
		 SubCategoryPojo sub=new SubCategoryPojo();
		 ResultSet rs=ps7.executeQuery();
		 if(rs.next()) {
			 sub.setProductId(rs.getString(1));
			 sub.setProductName(rs.getString(2));
			 sub.setMrp(rs.getInt(3));
			 sub.setDiscount(rs.getInt(4));
			 sub.setTotalPrice(rs.getInt(5));
		 }
		 DBConnection.closeConnection();
		 return sub;
		
		
	}
	
	/*** GETTING GRAM UNIT ID AND UNIT VALUE ***/
	public static HashMap<String,String> getGramUnit() throws Exception{
		return GlobalData.units;
	}
	
	/*** GETTING GRAM QUANTITY ***/
	public static ArrayList<Integer> gramQantity() throws Exception{
		ArrayList<Integer> gramQty = new ArrayList<>();
		gramQty.add(100);
		gramQty.add(250);
		gramQty.add(500);
		gramQty.add(1);
		gramQty.add(2);
		gramQty.add(3);
		gramQty.add(4);
		gramQty.add(5);
		return gramQty;
	}
	
	/*** GETTING LITER QUANTITY ***/
	public static ArrayList<Integer> literQantity() throws Exception{
		ArrayList<Integer> gramQty = new ArrayList<>();
		gramQty.add(1);
		gramQty.add(2);
		gramQty.add(3);
		gramQty.add(4);
		gramQty.add(5);
		gramQty.add(10);
		return gramQty;
	}
	
	/*** GETTING LITER UNIT ID AND UNIT VALUE ***/
	public static HashMap<String,String> getLiterUnit() throws Exception{
		HashMap<String,String> map = new HashMap<>();
		map.put("u103", "liter");
		return map;
	}
	
	public static List<OrdersPojo> findAllOrdersPlaced(String userid) throws Exception{
		List<OrdersPojo> orders = new ArrayList<>();
		DBConnection.connect();
		ps8.setString(1, userid);
		ResultSet rs = ps8.executeQuery();
		while(rs.next()) {
			orders.add(new OrdersPojo(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4),rs.getString(5),rs.getString(6)));
		}
		DBConnection.closeConnection();
		return orders;
	}
	
	public static boolean deleteFromPurchase(String pid, String orderid) throws Exception {
		DBConnection.connect();
		ps9.setString(1, pid);
		ps9.setString(2, orderid);
		
		return ps9.executeUpdate()>0;
	}
}
 