<%@ page import="java.sql.*" %>
<%
class Ticket 
{
    private int custId;
    private int busId;
    private String custName;
    private String email;
    private String phoneNo;
    private String source;
    private String destination;
    private Date departureDate;
    private Date returnDate;
    private int capacity;

    public Ticket(int custId, int busId, String custName, String email, String phoneNo, String source, String destination, Date departureDate, Date returnDate, int capacity) 
    {
        this.custId = custId;
        this.busId = busId;
        this.custName = custName;
        this.email = email;
        this.phoneNo = phoneNo;
        this.source = source;
        this.destination = destination;
        this.departureDate = departureDate;
        this.returnDate = returnDate;
        this.capacity = capacity;
    }

    public int getCustId() {
        return custId;
    }

    public int getBusId() {
        return busId;
    }

    public String getCustName() {
        return custName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public String getSource() {
        return source;
    }

    public String getDestination() {
        return destination;
    }

    public Date getDepartureDate() {
        return departureDate;
    }

    public Date getReturnDate() {
    	return returnDate;
    }

    public int getCapacity() {
        return capacity;
    }
}

// Connect to the PostgreSQL database
String url="jdbc:postgresql://localhost:5432/mydb";
String username="postgres";
String password="samusky18";
Connection conn = DriverManager.getConnection(url, username, password);

// Get the last row from the ticket table
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM bus_tickets ORDER BY cust_id DESC LIMIT 1");
rs.next();


// Create a new ticket object using the data from the last row
Ticket ticket = new Ticket(
    rs.getInt("cust_id"),
    rs.getInt("bus_id"),
    rs.getString("cust_name"),
    rs.getString("email"),
    rs.getString("phone_no"),
    rs.getString("source"),
    rs.getString("destination"),
    rs.getDate("departure_date"),
    rs.getDate("return_date"),
    rs.getInt("capacity")
);

// Close the database connection and resources
rs.close();
stmt.close();
conn.close();
%>

<%-- Display the ticket details using HTML --%>
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
  <div class="card__header">Ticket Details</div>
  <form method="POST" action="payment.jsp" class="form">
    <div class="input-wrapper">
    
    
    <p>Customer ID: <%= ticket.getCustId() %></p>
    <p>Bus ID: <%= ticket.getBusId() %></p>
    <p>Customer Name: <%= ticket.getCustName() %></p>
    <p>Email: <%= ticket.getEmail() %></p>
    <p>Phone Number: <%= ticket.getPhoneNo() %></p>
    <p>Source: <%= ticket.getSource() %></p>
    <p>Destination: <%= ticket.getDestination() %></p>
    <p>Departure Date: <%= ticket.getDepartureDate() %></p>
    <p>Return Date: <%= ticket.getReturnDate() %></p>
    <p>Capacity: <%= ticket.getCapacity() %></p>
    <input type="submit" value="Show Price" class="submit" required>
    </div>
</body>
</html>