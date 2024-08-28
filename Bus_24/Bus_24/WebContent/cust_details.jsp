<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.sql.*"%>

<html>
<body>
<% int flag=0;
//sCustomer Details
String cust_name=request.getParameter("n");
String email=request.getParameter("e");
String phone_no=request.getParameter("p");

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
	String sql1="insert into customer(cust_name,email,phone_no) values('"+cust_name+"','"+email+"','"+phone_no+"')";
	String sql2="select * from customer";
	ResultSet rs1 = null;
	ps1 = connection.prepareStatement(sql1);
	ps2 = connection.prepareStatement(sql2);
	
	rs1 = ps2.executeQuery();
	
	while(rs1.next())
	{
		
		if(cust_name.equals(rs1.getString("cust_name")) && email.equals(rs1.getString("email")) && phone_no.equals(rs1.getString("phone_no")))
		{
			flag=1;
		}
	}
	if(flag==0)
	{
		ps1.executeUpdate();
		response.sendRedirect("http://localhost:8080/Bus_24/main.jsp");
	}
	if(flag==1)
	{
		response.sendRedirect("http://localhost:8080/Bus_24/main.jsp");
	}
}
catch(Exception e)
{
	out.print(e);
	response.sendRedirect("http://localhost:8080/Bus_24/login.html");
}
%>
</body>
</html>
