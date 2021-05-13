package dbutils;
import java.sql.DriverManager;

import java.net.InetAddress;
import java.sql.Connection;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class DBConnection {
    private static Connection Conn;
    final static private String PASSWORD="pawan";
    final static private String USERNAME="root";
    final static private String DB_NAME="groceryshopping";
    final static int LOCALHOST=3306;
//    static 
//    {
//        try
//        {	
////            InetAddress adres=InetAddress.getLocalHost();
////            COMPUTER_NAME=adres.getHostName();
////            if(COMPUTER_NAME.equalsIgnoreCase("idea-PC")){
////                PASSWORD="pawan";
////                DB_NAME="groceryshopping";
////                LOCALHOST=3307;
////            }
////            else{
////                PASSWORD="admin";
////                DB_NAME="crazyshopping";
////                LOCALHOST=3306;
////            }
//           Class.forName("com.mysql.jdbc.Driver").newInstance();
//           Conn=DriverManager.getConnection("jdbc:mysql://localhost:"+LOCALHOST+"/"+DB_NAME+"?useSSL=false&autoReconnect=true&characterEncoding=latin1&useConfigs=maxPerformance",USERNAME,PASSWORD);
//            System.out.println("Connection openend!");           
//           }
//         catch(ClassNotFoundException cnfe)
//        {
//        	 System.out.println("Cannot Load Driver");
//            cnfe.printStackTrace();
//        }
//         catch(Exception sqlex)
//        {
//        	 System.out.println("DB error in opening connection in DBConnection!");
//            sqlex.printStackTrace();
//        }
//    }
    
    
   @SuppressWarnings("deprecation")
public static Connection connect() 
   {

       try
       {	
          Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
          Conn=DriverManager.getConnection("jdbc:mysql://localhost:"+LOCALHOST+"/"+DB_NAME+"?useSSL=false&autoReconnect=true&characterEncoding=latin1&useConfigs=maxPerformance&allowPublicKeyRetrieval=true",USERNAME,PASSWORD);
           System.out.println("Connection openend!");           
          }
        catch(ClassNotFoundException cnfe)
       {
       	 System.out.println("Cannot Load Driver");
           cnfe.printStackTrace();
           System.out.println("driver problem "+cnfe.getMessage());
       }
        catch(Exception sqlex)
       {
       	 System.out.println("DB error in opening connection in DBConnection!");
           sqlex.printStackTrace();
       }
       return Conn;
        
   }


   public static void closeConnection(){
     try
     {          
                if(Conn!=null) {
                Conn.close();
                System.out.println("connection closed");
                }
               
   }
        catch(SQLException e)
        {
            System.out.println("DB error in closing connection in DBConnection!");
            e.printStackTrace(); 
}
   }
}

