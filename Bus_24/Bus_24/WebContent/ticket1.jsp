<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Customer and Bus Tables and Store in Bus Tickets Table using JSP</title>
</head>
<body>

<% int flag=0;
    // Step 1: Define database connection parameters
    String url="jdbc:postgresql://localhost:5432/mydb";
    String username="postgres";
    String password="samusky18";


    // Step 2: Create a database connection
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("org.postgresql.Driver");
        out.println("first");
        conn = DriverManager.getConnection(url, username, password);

        // Step 3: Join customer and bus tables using a join query
        stmt = conn.createStatement();
        String joinQuery = "SELECT customer.cust_id, customer.cust_name, customer.email, customer.phone_no, bus_details.bus_id, bus_details.source, bus_details.destination, bus_details.departure_date, bus_details.return_date, bus_details.capacity FROM customer JOIN bus_details ON customer.cust_id != bus_details.bus_id";
        rs = stmt.executeQuery(joinQuery);
        //out.println("sec");
        // Step 4: Store the results in the bus_tickets table
        PreparedStatement ps1=null, ps2=null;
        String sql1 = "INSERT INTO bus_tickets (cust_id, bus_id, cust_name, email, source, destination, departure_date, return_date, capacity, phone_no) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        out.println("sec");
        while (rs.next()) {
            ps1= conn.prepareStatement(sql1);
            ps1.setInt(1, rs.getInt("cust_id"));
            ps1.setInt(2, rs.getInt("bus_id"));
            ps1.setString(3, rs.getString("cust_name"));
            ps1.setString(4, rs.getString("email"));
            ps1.setString(5, rs.getString("source"));
            ps1.setString(6, rs.getString("destination"));
            ps1.setDate(7,rs.getDate("departure_date"));
            ps1.setDate(8, rs.getDate("return_date"));
            ps1.setInt(9, rs.getInt("capacity"));
            ps1.setString(10, rs.getString("phone_no"));
            //ps1.executeUpdate();
           
        }
        out.println("third");
        String sql2="select * from bus_tickets";
        ResultSet rs1 = null;
        ps2 = conn.prepareStatement(sql2);
        
        rs1 = ps2.executeQuery();
        out.println("fourth");
    	while(rs1.next())
    		out.println("fifth");
    	if(flag==0)
    	{
    		ps1.executeUpdate();
    		response.sendRedirect("http://localhost:8080/Bus_24/ticket2.jsp");
    	}
    	if(flag==1)
    	{
    		response.sendRedirect("http://localhost:8080/Bus_24/ticket2.jsp");
    	}
    }
    catch(Exception e)
    {
    	out.print(e);
    	response.sendRedirect("http://localhost:8080/Bus_24/main.jsp");
    }
    %>
    </body>
    </html>
