package DBPKG;
import java.sql.*;

public class DBOpen {
	public static Connection getConnetion() throws Exception{
		//static -> 클래스명으로 직접 접근 가능하다.
	
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con = DriverManager.getConnection ("jdbc:mysql://localhost/khe0124","khe0124","xptmffk12!");
		return con;		
	}	
}


