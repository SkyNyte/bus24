<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.sql.*"%>

<html>
<body>
<% int flag=0;
String source = request.getParameter("source");
String destination = request.getParameter("destination");
String departure_date = request.getParameter("departure_date");
String return_date = request.getParameter("return_date");
String capacity = request.getParameter("capacity");

String url="jdbc:postgresql://localhost:5432/mydb";
String username="postgres";
String password="samusky18";

// Fetching cust_id from customer table
String cust_id = "";
try {
    Connection conn = DriverManager.getConnection(url, username, password);
    Statement stmt = conn.createStatement();
    String sql = "SELECT cust_id FROM customer";
    ResultSet rs = stmt.executeQuery(sql);
    if (rs.next()) {
        cust_id = rs.getString("cust_id");
    }
    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}

// Inserting data into bus table
try {
    Connection connection = DriverManager.getConnection(url, username, password);
    String sql1 = "INSERT INTO bus_detailss(cust_id, source, destination, departure_date, return_date, capacity) VALUES (?, ?, ?, ?, ?, ?)";
    String sql2="select * from bus_detailss";
    ResultSet rs1 = null;
    PreparedStatement ps1 = connection.prepareStatement(sql1);
    ps1.setString(1, cust_id);
    ps1.setString(2, source);
    ps1.setString(3, destination);
    ps1.setString(4, departure_date);
    ps1.setString(5, return_date);
    ps1.setString(6, capacity);
    PreparedStatement ps2 = connection.prepareStatement(sql2);
    
    rs1 = ps2.executeQuery();
    
    while(rs1.next())
	{
		
		if(source.equals(rs1.getString("source")) && destination.equals(rs1.getString("destination")))
		{
			flag=1;
		}
	}
	if(flag==0)
	{
		ps1.executeUpdate();
		response.sendRedirect("http://localhost:8080/Bus_24/ticket.jsp");
	}
	if(flag==1)
	{
		response.sendRedirect("http://localhost:8080/Bus_24/ticket.jsp");
	}
}
catch(Exception e)
{
	out.print(e);
	//response.sendRedirect("http://localhost:8080/Bus_24/main.jsp");
}
%>
</body>
</html>