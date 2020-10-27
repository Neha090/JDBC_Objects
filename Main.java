 package sql;
import java.util.*;
import java.sql.*;
import oracle.jdbc.*;

public class Main {
	
	public static void main(String[] args)
	{
		Scanner sc=new Scanner(System.in);
		
		try 
		{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","sysadmin");
			System.out.println("Enter person name");
			String name=sc.next();
			System.out.println("Enter person department");
			String dept=sc.next();
			System.out.println("Enter person Address street number");
			int street=sc.nextInt();
			System.out.println("Enter person Address City");
			String city=sc.next();
			
			CallableStatement csmt = (CallableStatement)con.prepareCall("{call Create_emp(?,?,?,?)}");
			csmt.setString(1,dept);
			csmt.setString(2,name);
			csmt.setInt(3,street);
			csmt.setString(4,city);
			int r=csmt.executeUpdate();
			if(r>0)
			{
				System.out.println("person added successfully !!!!!!");
			}
			
			csmt.close();
			con.close();
			
			
		}
		catch(Exception e){
			System.out.println(e);
		}
		
		
		
		
		
	}

}
