package DBPKG;
import java.sql.*;

public class DBOpen {
	public static Connection getConnetion() throws Exception{
		//static -> 클래스명으로 직접 접근 가능하다.
	
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","java0514","1234");
		return con;		
	}	
}
