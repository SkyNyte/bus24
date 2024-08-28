<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.sql.*"%>

<html>
<body>
<% int flag=0;
//sCustomer Details
String name=request.getParameter("name");
String source = request.getParameter("source");
String destination = request.getParameter("destination");
String departure_date = request.getParameter("departure_date");
String return_date = request.getParameter("return_date");
String capacity = request.getParameter("capacity");
String price = request.getParameter("price");

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
	String sql1="INSERT INTO admin(name,source,destination,departure_date,return_date,capacity,price) VALUES('"+name+"','"+source+"','"+destination+"','"+departure_date+"','"+return_date+"','"+capacity+"','"+price+"')";
	String sql2="select * from admin";
	ResultSet rs1 = null;
	ps1 = connection.prepareStatement(sql1);
	ps2 = connection.prepareStatement(sql2);
	
	rs1 = ps2.executeQuery();
	
	while(rs1.next())
	{
		
		if(name.equals(rs1.getString("name")) && source.equals(rs1.getString("source")) && destination.equals(rs1.getString("destination")))
		{
			flag=1;
		}
	}
	if(flag==0)
	{
		ps1.executeUpdate();
		response.sendRedirect("http://localhost:8080/Bus_24/a_ticket.jsp");
	}
	if(flag==1)
	{
		response.sendRedirect("http://localhost:8080/Bus_24/a_ticket.jsp");
	}
}
catch(Exception e)
{
	out.print(e);
	response.sendRedirect("http://localhost:8080/Bus_24/First.html");
}
%>
</body>
</html>
