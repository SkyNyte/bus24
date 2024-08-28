<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<style>
     
 
  /* avoid page breaks in tables */
@media print {
 
    table {
        page-break-inside: avoid;
    }
}

body {
  font-family:'Open Sans';
  font-size:16px;
  font-weight:400;
  line-height:25px;
  color:#000;
  
  margin:0px;
padding:opx;
box-sizing:border-box;
width:100%;
height:100vh;
background-image:url('f.jpg');
background-repeat:no-repeat;
background-size:cover;
background-position:center;
     
}


 {
  max-width:1000px;
  margin:50px 50px;
  overflow:auto;
}

h1 {
  font-size:40px;
  font-weight:400;
}

h2 {
  font-size:26px;
  font-weight:400;
}

a {
  color:#006ba6;
  text-decoration: none;
}

a:hover, .anchor:hover {
    text-decoration: underline;
}

table {
  width:100%;
  border-collapse:collapse;
  border-spacing:15px;
  margin-bottom:70px;
  table-layout: center;
  table-align:center;
}

table caption {
    text-align: right;
    caption-side: bottom;
    font-size: 14px;
    padding: 5px 0;
    font-style: italic;
}

tr {
  transition: all 0.25s ease-in-out;
}

tr:hover {
    background: #f7f7f7;
}

th {
    padding: 15px 10px;
    vertical-align: middle;
    text-align: left;
    border-bottom: 1px solid #D3D6DC;
    color: #677083;
    font-weight: 400;
    text-transform: uppercase;
    font-size: 14px;
}

/*table border color #D3D6DC is from styleguide $graphite-dark
*/
th[scope=col] {
    border-bottom: 3px solid #D3D6DC;
}

th[scope=row] {
    border-right: 3px solid #D3D6DC;
}

td {
    padding: 15px 15px;
    border-bottom: 1px solid #D3D6DC;
}

/* styles for code snippets */


    </style>
<title>Customer Table</title>
</head>
<body>
<h2 align="center"><i>Payment Table</i></h2>
<%
String url="jdbc:postgresql://localhost:5432/mydb";
String username="postgres";
String password="samusky18";
// Get the customer details from the HTML form
String source = request.getParameter("source");
String destination = request.getParameter("destination");
String departure_date = request.getParameter("departure_date");
String return_date = request.getParameter("return_date");
String capacity = request.getParameter("capacity");



// Connect to the database
Connection con = null;
PreparedStatement ps1=null, ps2=null;
Class.forName("org.postgresql.Driver");
con = DriverManager.getConnection(url, username, password);

// Insert the customer details into the bus table
String sql1 = "INSERT INTO payments(cust_id,bus_id,cust_name,email) VALUES (?, ?, ?, ?)";
ps1 = con.prepareStatement(sql1);


// Close the database connection
ps1.close();
con.close();

// Display the bus table in HTML format
%>
 
<article>
<table role="grid" >
  <!-- summary is for screen readers -->
<caption>Bus Reservation System By SkyZee</caption>
  <!-- optional caption provides context for the table, especially if it has data in it -->
<tr>
<th scope="col">Customer ID </th>
<th scope="col">Bus ID </th>
<th scope="col">Name</th>
<th scope="col">Email</th>
</tr>

<%

// Connect to the database
con = null;

Class.forName("org.postgresql.Driver");
con = DriverManager.getConnection(url, username, password);
// Retrieve the bus records from the database
 String sql2 = "SELECT * FROM payments";
ps2 = con.prepareStatement(sql2);
ResultSet rs2 = ps2.executeQuery();

// Loop through the bus records and display them in HTML format
while (rs2.next()) {
%>
<tr>
<td><%= rs2.getInt("cust_id") %></td>
<td><%= rs2.getString("bus_id") %></td>
<td><%= rs2.getString("cust_name") %></td>
<td><%= rs2.getString("email") %></td>

</tr>
<%
}

// Close the database connection
rs2.close();
ps2.close();
con.close();
%>

</table>

</article>

</main>
</body>
</html>




