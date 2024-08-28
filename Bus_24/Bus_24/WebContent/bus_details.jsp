<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.sql.*"%>

<html>
<body>
<% int flag=0;
//sCustomer Details

String source = request.getParameter("source");
String destination = request.getParameter("destination");
String departure_date = request.getParameter("departure_date");
String return_date = request.getParameter("return_date");
String capacity = request.getParameter("capacity");

//Connection code
String url="jdbc:postgresql://localhost:5432/mydb";
String username="postgres";
String password="samusky18";

try
{
	Class.forName("org.postgresql.Driver");
	Connection connection = DriverManager.getConnection(url, username, password);
	PreparedStatement ps1=null, ps2=null;
	//Query
	String sql1 = "INSERT INTO bus_details(source,destination,departure_date,return_date,capacity) VALUES('"+source+"','"+destination+"','"+departure_date+"','"+return_date+"','"+capacity+"')";
	String sql2="select * from bus_details";
	ResultSet rs1 = null;
	ps1 = connection.prepareStatement(sql1);
	ps2 = connection.prepareStatement(sql2);
	
	rs1 = ps2.executeQuery();
	
	while(rs1.next())
	{
		
		if(source.equals(rs1.getString("source")) && destination.equals(rs1.getString("destination")) && departure_date.equals(rs1.getString("departure_date")) && return_date.equals(rs1.getString("return_date")) && capacity.equals(rs1.getString("capacity")))
		{
			flag=1;
		}
	}
	if(flag==0)
	{
		ps1.executeUpdate();
		response.sendRedirect("http://localhost:8080/Bus_24/ticket1.jsp");
	}
	if(flag==1)
	{
		response.sendRedirect("http://localhost:8080/Bus_24/ticket1.jsp");
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