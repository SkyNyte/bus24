<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>Payment</title>
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
  margin: 1rem;
  padding: 2rem;
  border-radius: 10px;
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
  <div class="card__header">Payment Details </div>
  <form method="POST" action="payment2.html" class="form">
    <div class="input-wrapper">

<%
// Database connection details
String url="jdbc:postgresql://localhost:5432/mydb";
String username="postgres";
String password="samusky18";

// Establishing a database connection
Class.forName("org.postgresql.Driver");
Connection con = DriverManager.getConnection(url, username, password);

// Retrieving the last row from the table
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM bus_tickets ORDER BY cust_id DESC LIMIT 1");
rs.next(); // Move the cursor to the first row

// Extracting the required data from the result set
String custName = rs.getString("cust_name");
String source = rs.getString("source");
String destination = rs.getString("destination");
int capacity = rs.getInt("capacity");
double ticketPrice = 1208.0; // Assuming the ticket price is fixed at Rs. 500

// Calculating the total payment in Rupees
double totalPayment = capacity * ticketPrice;

// Displaying the payment details in Rupees

out.println("<p>Customer Name: " + custName + "</p>");
out.println("<p>Source: " + source + "</p>");
out.println("<p>Destination: " + destination + "</p>");
out.println("<p>Capacity: " + capacity + "</p>");
out.println("<p>Ticket Price: Rs. " + ticketPrice + "</p>");
out.println("<p>Total Payment: Rs. " + totalPayment + "</p>");

// Closing the database connection
rs.close();
stmt.close();
con.close();
%>
<input type="submit" value="Make Payment" class="submit" required></form>

<form method="POST" action="login.html" class="form">
<div class="input-wrapper">
<input type="submit" value="Cancel Booking" class="submit" required></form>

    </div>
</body>
</html>
