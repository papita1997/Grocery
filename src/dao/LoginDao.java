package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutils.DBConnection;

public class LoginDao {
		private static PreparedStatement ps,ps1;
	static {
		try {
			ps = DBConnection.connect().prepareStatement("select username,type from user where userid=? and password=? ");
			ps1 = DBConnection.connect().prepareStatement("select username from user where userid=? and password=? ");
	
			
			
		} catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
		}
	}
	
	
	public static List<String> validateUser(String userid,String password) throws Exception{
		DBConnection.connect();
		ps.setString(1, userid);
		ps.setString(2, password);
		List<String> list  = new ArrayList<>();
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			list.add(rs.getString(1));
			list.add(rs.getString(2));
		} 
		DBConnection.closeConnection();
		return list;
	}
	
	public static String validateUser1(String userid,String password) throws Exception{
		DBConnection.connect();
		ps1.setString(1, userid);
		ps1.setString(2, password);
		ResultSet rs = ps1.executeQuery();
		if(rs.next()) {
			DBConnection.closeConnection();
			return rs.getString(1);
		} 
		DBConnection.closeConnection();
		return "not";
	}
}
