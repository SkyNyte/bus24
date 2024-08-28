import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CustomerServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ResultSet rs1;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		
		int flag=1;
        // Retrieve customer information from HTML form
        String cust_name = request.getParameter("n");
        String email = request.getParameter("e");
        String phone_no = request.getParameter("p");
        
        
        // Connect to the database
        String url = "jdbc:mysql://localhost:5432/mydb";
        String user = "postgres";
        String password = "samusky18";
        
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        try {
            Class.forName("org.postgres.jdbc.Driver");
            
            out.println("dl");
            Connection con = DriverManager.getConnection(url, user, password);
            
            // Insert customer information into database
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO customers (cust_name, email, phone_no) VALUES (?, ?, ?)");
            pstmt.setString(1, cust_name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone_no);
            // Close database connection and redirect to success page
            con.close();
            rs1 = null;
			while(rs1.next())
        	{
        		String n= rs1.getString("cust_name");
        		if(cust_name.equals(n))
        		{
        			flag=1;
        		}
        	}
        	if(flag==0)
        	{
        		pstmt.executeUpdate();
        		response.sendRedirect("http://127.0.0.1:8080/main.html");
        	}
        	if(flag==1)
        	{
        		response.sendRedirect("http://127.0.0.1:8080/main.html");
        	}
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


