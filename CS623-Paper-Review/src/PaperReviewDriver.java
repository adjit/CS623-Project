import java.sql.*;

public class PaperReviewDriver {
	
	static String getAuth = "SELECT\r\n" + 
			"    sp.Paper_id,\r\n" + 
			"    p.Title,\r\n" + 
			"    p.Abstract,\r\n" + 
			"    a.EmailAddr,\r\n" + 
			"    a.FirstName,\r\n" + 
			"    a.LastName\r\n" + 
			"FROM SUBMITS_PAPER sp\r\n" + 
			"Join PAPERS p\r\n" + 
			"    ON sp.Paper_id = p.Paper_id\r\n" + 
			"JOIN AUTHORS a\r\n" + 
			"    on sp.Author_id = a.EmailAddr\r\n" + 
			"WHERE sp.Author_id = '{0}'";

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/Conference_Review";
		String sqlUser = "root";
		String sqlPass = "pass";
		
		try {
			Connection conn = DriverManager.getConnection(url,sqlUser, sqlPass);
			System.out.println("Database Connected...");
			
			getPaperByAuthor("abc@123.com", conn);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
	
	public static void getPaperByAuthor(String author, Connection conn) {
		String replacement = getAuth.replace("{0}","abc@123.com");			
		Statement stmt;
		try {
			stmt = conn.createStatement();		
			ResultSet rs = stmt.executeQuery(replacement);
			
			while(rs.next()) {
				int paperId = rs.getInt("Paper_id");
				String title = rs.getString("Title");
				String paperAbstract = rs.getString("Abstract");
				String emailAddr = rs.getString("EmailAddr");
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				
				System.out.println("Paper_id - " + paperId);
				System.out.println("Title - " + title);
				System.out.println("Abstract - " + paperAbstract);
				System.out.println("EmailAddr - " + emailAddr);
				System.out.println("FirstName - " + firstName);
				System.out.println("LastName - " + lastName);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
