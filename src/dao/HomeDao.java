package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dbutils.DBConnection;
import pojo.BasketPojo;
import pojo.ProductPojo;
import pojo.SubCategoryPojo;

public class HomeDao {
	
	private static Statement st,st1,st2,st3,st4;
	private static PreparedStatement ps,ps1,ps2,ps3,ps4;
	

	static {
		try {
			Connection conn=DBConnection.connect();
			st=conn.createStatement();
			st1=conn.createStatement();
			st2=conn.createStatement();
			st3=conn.createStatement();
			st4=conn.createStatement();
			ps=conn.prepareStatement("insert into basket values(?,?,?)");
			ps1=conn.prepareStatement("select count(*) from basket where userid=?");
			ps2=conn.prepareStatement("select product.prod_id,pd_name,tprice,quantiy,img1 from product,basket,images where images.prod_id=product.prod_id and basket.userid=? and product.prod_id=basket.pro_id;");
			ps3=conn.prepareStatement("select pro_id from basket where userid=? and pro_id=? ");
			ps4=conn.prepareStatement("delete from basket where pro_id=? and userid=?");
		}
		catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
		}
		
	}
	
	public static List<ProductPojo> allRandProduct() throws Exception {
		DBConnection.connect();
		ResultSet rs=st.executeQuery("select product.prod_id,pd_name,tprice,img1 from product,images where product.prod_id = images.prod_id ORDER BY RAND() LIMIT 8");
		List<ProductPojo> list = new ArrayList<>();
		while(rs.next()) {
			ProductPojo prod = new ProductPojo();
			prod.setProdId(rs.getString(1));
			prod.setProdName(rs.getString(2));
			prod.setTotalPrice(rs.getInt(3));
			prod.setProdImages(rs.getString(4));
			list.add(prod);
			
		}
		DBConnection.closeConnection();
		return list;
	}

		
	public static List<ProductPojo> allRandProductLimit4() throws Exception {
		DBConnection.connect();
		ResultSet rs=st1.executeQuery("select product.prod_id,pd_name,tprice,img1 from product,images where product.prod_id = images.prod_id ORDER BY RAND() LIMIT 4");
		List<ProductPojo> list = new ArrayList<>();
		while(rs.next()) {
			ProductPojo prod = new ProductPojo();
			prod.setProdId(rs.getString(1));
			prod.setProdName(rs.getString(2));
			prod.setTotalPrice(rs.getInt(3));
			prod.setProdImages(rs.getString(4));
			list.add(prod);
			
		}
		DBConnection.closeConnection();
		return list;
	}
	
	public static boolean AddToCart(BasketPojo basket) throws Exception {
		DBConnection.connect();
		ps.setString(1, basket.getUserId());
		ps.setString(2, basket.getProductID());
		ps.setInt(3, basket.getQuantity());
		
		ps3.setString(1, basket.getUserId());
		ps3.setString(2, basket.getProductID());
		ResultSet rs=ps3.executeQuery();
		
		if(!rs.next()) {
			int Result=ps.executeUpdate();
			DBConnection.closeConnection();
			return Result>0;
		}
		else {
			DBConnection.closeConnection();
			return false;
		}
	}
	
	public static int CartCount(String userid) throws Exception {
		DBConnection.connect();
		ps1.setString(1, userid);
		ResultSet rs=ps1.executeQuery();
		int count=0;
		if(rs.next())
		{
			count=rs.getInt(1);
		}
		DBConnection.closeConnection();
		
		return count;
	}

	public static List<BasketPojo> AllBasketData(String userid) throws Exception {
		DBConnection.connect();
		ps2.setString(1, userid);
		ResultSet rs=ps2.executeQuery();
		List<BasketPojo> list =new ArrayList<>();
		while(rs.next()) {
			BasketPojo basket =new BasketPojo();
			basket.setProductID(rs.getString(1));
			basket.setProductName(rs.getString(2));
			basket.settPrice(rs.getInt(3));
			basket.setQuantity(rs.getInt(4));
			basket.setImages(rs.getString(5));
			list.add(basket);
			
		}
		DBConnection.closeConnection();
		return list;
		
	}
	
	public static boolean DeleteFromCart(BasketPojo basket) throws Exception{
		DBConnection.connect();
		ps4.setString(1,basket.getProductID());
		ps4.setString(2, basket.getUserId());
		int Result=ps4.executeUpdate();
		DBConnection.closeConnection();
		return Result>0;
	}
	
	public static HashMap<String,String> Suggestions(String str) throws Exception{
		DBConnection.connect();
		ResultSet rs=st2.executeQuery("select pd_name,prod_id from product where pd_name like '%"+str+"%'");
		HashMap<String,String> map=new HashMap<>();
		while(rs.next()) {
			map.put(rs.getString(2), rs.getString(1));
		}
		DBConnection.closeConnection();
		return map;
	}
	
	public static List<SubCategoryPojo> SearchButton(String str) throws Exception{
		DBConnection.connect();
		ResultSet rs=st3.executeQuery("select product.prod_id,pd_name,cname,mrp,disc,tprice,img1 from product,category,images where product.prod_id=images.prod_id and product.cat_id =category.cat_id and pd_name like '%"+str+"%' LIMIT 12");
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
	
	public static List<SubCategoryPojo> getSearchRand() throws Exception{
		DBConnection.connect();
		ResultSet rs=st4.executeQuery("select product.prod_id,pd_name,cname,mrp,disc,tprice,img1 from product,category,images where product.prod_id=images.prod_id and product.cat_id =category.cat_id ORDER BY RAND() LIMIT 6");
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
	
}
