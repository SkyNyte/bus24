
import java.sql.*;
import java.io.*;

public class customer_detail
{
    

	private static String cust_name;

	public static void main(String[] args) throws SQLException,IOException
    {
       Connection con = null;
       PreparedStatement ps1=null, ps2=null;
       ResultSet rs = null;
       String email = null;
       int phone_no=0;
       int flag=0;
     
       String n=null;
       
       try
       {
    	   cust_name = null;
    	   Class.forName("org.postgresql.Driver");
    	   System.out.println("Driver Loaded");
    	   
    	   con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb","postgres","samusky18");
    	   System.out.println("Connected");
    	   
    	   String sql1="insert into customer(cust_name,email,phone_no) values('"+cust_name+"','"+email+"','"+phone_no+"')";
    	   String sql2="select * from customer";
    	   ps1 = con.prepareStatement(sql1);
    	   ps2 = con.prepareStatement(sql2);
    	   rs = ps2.executeQuery();
    	   System.out.println("Statement done");
    	  
    	  
    	   while(rs.next())
    	   {
    			n= rs.getString("cust_name");
    			if(cust_name.equals(n))
    			{
    				System.out.println("ok");
    				flag=1;
    			}
    	   }
    	   if(flag==0)
    	   {
    			ps1.executeUpdate();
    	   }
       }
       catch(Exception e)
       {
    	   System.out.println(e);
       }
    }
}
    	   
       
    	   
    	   
    	   
    	   