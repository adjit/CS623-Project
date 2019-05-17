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
	
	static String getReview = "SELECT *\r\n" + 
			"FROM REVIEW\r\n" + 
			"WHERE Paper_id = {0}";
	
	static String getPaperCountQuery = "SELECT COUNT(Paper_id)\r\n" + 
			"FROM SUBMITS_PAPER";
	
	static String submissionAuthorQuery = "INSERT INTO AUTHORS (EmailAddr, FirstName, LastName)\r\n" + 
			"VALUES (?, ?, ?)";
	
	static String submissionPaperQuery = "INSERT INTO PAPERS (Title, Abstract, Paper_FileName)\r\n" + 
			"VALUES (?, ?, ?)";

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/Conference_Review";
		String sqlUser = "root";
		String sqlPass = "pass";
		
		try {
			Connection conn = DriverManager.getConnection(url,sqlUser, sqlPass);
			System.out.println("Database Connected...");
			System.out.println("==================");
			
			getPaperByAuthor("abc@123.com", conn);
			getReview(2, conn);
			getPaperCount(conn);
			submitPaper("someEmail.com", "Bob", "Jones", "Why SQL Rocks",
					"I really like using SQL", "mysql.pdf", conn);
			deleteAuthor(conn);
			
			System.out.println("Continuing...");
			System.out.println("==================");	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
	
	public static void getPaperByAuthor(String author, Connection conn) {
		String query = getAuth.replace("{0}","abc@123.com");			
		Statement stmt;
		try {
			stmt = conn.createStatement();		
			ResultSet rs = stmt.executeQuery(query);
			
			parseResults(rs);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void getReview(int id, Connection conn) {
		String query = getReview.replace("{0}", Integer.toString(id));
		Statement stmt;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			parseResults(rs);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void parseResults(ResultSet rs) {
		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()) {
				for(int i = 1; i <= rsmd.getColumnCount(); i++) {
					System.out.println(rsmd.getColumnName(i) + " - " + rs.getObject(i));
				}
				System.out.println("==================");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void getPaperCount(Connection conn) {
		Statement stmt;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(getPaperCountQuery);
			
			parseResults(rs);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void submitPaper(String emailAddr, String firstName, String lastName,
						String Title, String paperAbstract, String fileName, Connection conn) {
		try {
			PreparedStatement preparedStmt = conn.prepareStatement(submissionAuthorQuery);
			preparedStmt.setString(1, emailAddr);
			preparedStmt.setString(2, firstName);
			preparedStmt.setString(3, lastName);
			
			preparedStmt.execute();
			
			preparedStmt = conn.prepareStatement(submissionPaperQuery,1);
			preparedStmt.setString(1, Title);
			preparedStmt.setString(2, paperAbstract);
			preparedStmt.setString(3, fileName);
			
			preparedStmt.execute();
			
			String query = "INSERT INTO SUBMITS_PAPER (Paper_id, Author_id) " +
					"VALUES (?, ?)";
			
			ResultSet generatedKeys = preparedStmt.getGeneratedKeys();
			if(generatedKeys.next()) {
				PreparedStatement ns = conn.prepareStatement(query);
				ns.setInt(1, generatedKeys.getInt(1));
				ns.setString(2, emailAddr);
				
				ns.execute();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void deleteAuthor(Connection conn) {
		String query = "DELETE FROM AUTHORS LIMIT 1";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Trying to delete has cause a cannot delete parent error");
			e.printStackTrace();
		}
			
	}

}
