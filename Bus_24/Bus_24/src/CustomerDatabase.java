import java.sql.*;

public class CustomerDatabase {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/customerdb";
        String username = "root";
        String password = "password";
        
        try {
            // Establish a connection to the database
            Connection connection = DriverManager.getConnection(url, username, password);
            
            // Prepare a SQL statement for inserting customer data
            String insertQuery = "INSERT INTO customers (name, email, phone) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            
            // Fetch customer data from HTML login page
           // String customerName = request.getParameter("name");
            //String customerEmail = request.getParameter("email");
            //String customerPhone = request.getParameter("phone");
            
            // Set parameters for the SQL statement
           // preparedStatement.setString(1, customerName);
           // preparedStatement.setString(2, customerEmail);
           // preparedStatement.setString(3, customerPhone);
            
            // Execute the SQL statement and store customer data in the database
            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Customer data inserted successfully!");
            }
            
            // Close the database connection and statement
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}