package databaseconnection;
import java.sql.*;

public class Databasecon
{
	static Connection con;
	public static Connection getConnection()
	{
 		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");	
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork","root","admin");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	
}

