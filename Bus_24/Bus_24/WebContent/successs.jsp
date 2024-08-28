<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>Ticket</title>
  <style>
  :root {
  --blue: #0dafeb;
  --rose: #D81E5B;
  --black: #343434;
  --bg: #e0e0e0;
  font-family: 'Montserrat';
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
  height: 100vh;
  background-color: var(--bg);
  display: flex;
  justify-content: center;
  align-items: center;
  color: var(--black);
}

.card {
  background-color: var(--bg);
  width: 400px;
  height: auto;
  margin: 10rem;
  padding: 4rem;
  border-radius: 100px;
  box-shadow:
    10px 10px 22px rgba(0, 0, 0, 0.2),
    -10px -10px 22px rgba(255, 255, 255, 0.75);
}

.card__header {
  font-size: 1.8rem;
  text-transform: uppercase;
  font-weight: 500;
  text-align: center;
}

.form {
  margin: 2rem 0;
}

.input-wrapper {
  width: 100%;
  margin-bottom: 0.5rem;
  display: flex;
  flex-direction: column;
}

.input-wrapper label {
  font-size: 0.9rem;
  font-weight: 400;
  margin-left: 0.8rem;
}

.input-wrapper input {
  border: none;
  outline: none;
  background: none;
  background-color: var(--bg);
  padding: 0.8rem 1.1rem;
  border-radius: 20px;
  margin: 0.5rem 0 1rem 0;
  font-size: 1.2rem;
  color: var(--blue);
  box-shadow:
    inset 5px 5px 11px rgba(0, 0, 0, 0.2),
    inset -5px -5px 11px rgba(255, 255, 255, 0.75);
}

.form button {
  border: none;
  outline: none;
  background: none;
  width: 100%;
  margin: 0.6rem 0 1rem 0;
  cursor: pointer;
  font-size: 1.2rem;
  color: var(--blue);
  text-transform: capitalize;
  padding: 0.9rem;
  border-radius: 20px;
  background-color: var(--bg);
  box-shadow:
    10px 10px 22px rgba(0, 0, 0, 0.2),
    -10px -10px 22px rgba(255, 255, 255, 0.75);
}

.form button:active {
  box-shadow:
    inset 5px 5px 11px rgba(0, 0, 0, 0.2),
    inset -5px -5px 11px rgba(255, 255, 255, 0.75);
}

.card__footer p {
  text-align: center;
  font-size: 0.9rem;
  margin: 0;
}

.card__footer a {
  text-decoration: none;
  color: var(--rose);
}
body {
margin:0px;
padding:opx;
box-sizing:border-box;
width:100%;
height:100vh;
background-image:url('4.jpg');
background-repeat:no-repeat;
background-size:cover;
background-position:center;
     
}

.card__footer a:hover {
  text-decoration: underline;
}  
.button#lel{
  font-size: 20px;
  font-family: Raleway;
  
  color: white;
  position: absolute;
  margin-top: 15px;
  -webkit-animation: button 1.6s;
  -webkit-animation-iteration-count: 1;
  animation: button 1.6s;
  animation-iteration-count: 1;
   background-color: #90C53F;
  border-radius: 15px;
  padding: 10px;
  border-bottom: 5px solid green;
  left: 50%;
  margin-left: -50px;
  cursor:pointer;
 
}
.button#lel:active {
  border-bottom: 0px solid #D2691E;
  margin-top: 30px;
}
.button#lel a{
  text-decoration: none;
  color: white;
}

 .submit {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #9C27B0, #E040FB);
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 35%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
  </style>
  </head>
<body>
<div class="card">
  <div class="card__header">Payment Successful</div>
  
  <form method="POST" action="admin_login.html">
  <button class="button" id="lel" > LOGOUT</button><br></form></div>
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
        //out.println("first");
        conn = DriverManager.getConnection(url, username, password);

        // Step 3: Join customer and bus tables using a join query
        stmt = conn.createStatement();
        String joinQuery = "SELECT customer.cust_id, customer.cust_name, customer.email, customer.phone_no, bus_details.bus_id, bus_details.source, bus_details.destination, bus_details.departure_date, bus_details.return_date, bus_details.capacity FROM customer JOIN bus_details ON customer.cust_id != bus_details.bus_id";
        rs = stmt.executeQuery(joinQuery);
        //out.println("sec");
        // Step 4: Store the results in the bus_tickets table
        PreparedStatement ps1=null, ps2=null;
        String sql1 = "INSERT INTO payments (cust_id, bus_id, cust_name, email) VALUES (?, ?, ?, ?)";
        //out.println("sec");
        while (rs.next()) {
            ps1= conn.prepareStatement(sql1);
            ps1.setInt(1, rs.getInt("cust_id"));
            ps1.setInt(2, rs.getInt("bus_id"));
            ps1.setString(3, rs.getString("cust_name"));
            ps1.setString(4, rs.getString("email"));
                       
           // ps1.executeUpdate();
           
        }
        //out.println("third");
        String sql2="select * from payments";
        ResultSet rs1 = null;
        ps2 = conn.prepareStatement(sql2);
        
        rs1 = ps2.executeQuery();
        //out.println("fourth");
    	
    	if(flag==0)
    	{
    		ps1.executeUpdate();
    		//response.sendRedirect("http://localhost:8080/Bus_24/ticket2.jsp");
    	}
    	if(flag==1)
    	{
    		//response.sendRedirect("http://localhost:8080/Bus_24/ticket2.jsp");
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