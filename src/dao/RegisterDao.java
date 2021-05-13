package dao;

import java.sql.PreparedStatement;

import dbutils.DBConnection;
import pojo.UserPojo;

public class RegisterDao  {
	private static PreparedStatement ps;
	static {
		try {
			ps = DBConnection.connect().prepareStatement("insert into user values(?,?,?,?,?,?)");
			
			
			
		}
		catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
		}
		
	}
	
	public static boolean register(UserPojo user) throws Exception{
		DBConnection.connect();
		ps.setString(1, user.getUserid());
		ps.setString(2, user.getPassword());
		ps.setString(3, user.getUsername());
		ps.setString(4, user.getPhone_no());
		ps.setString(5, null);
		ps.setString(6, "USER");
		int result = ps.executeUpdate();
		DBConnection.closeConnection();
		return result>0;
		
	}
}
