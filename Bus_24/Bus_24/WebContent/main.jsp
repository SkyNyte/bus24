<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
String cust_name=request.getParameter("n");
String email=request.getParameter("e");
String phone_no=request.getParameter("p");
%>
<!DOCTYPE html>
<html>
  <head>
  <title>main</title>
 <script>
   
    document.getElementById("date").innerHTML = "Today's date is " + dateString;
      $('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});
    </script>
  <style>
    @import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 560px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 560px;
  margin: 20 auto 100px;
  padding: 20px;

  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 20;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: auto;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
margin:0px;
padding:opx;
box-sizing:border-box;
width:100%;
height:100vh;
background-image:url('12.jpg');
background-repeat:no-repeat;
background-size:cover;
background-position:center;
     
}

    </style>
  </head>
 
 
  <div class="login-page">
  <div class="form">
    <h1 align=center><b>BUS BOOKING</b></h1><br>
   
    <form method="POST" action="bus_details.jsp"required>
        <label>    <h3> Source:		<select name="source" id="source"required>
        						<option value=" ">Select a city</option>
                                  <option>Pune</option>
                                  <option>Mumbai</option>
                                 <option>Bangalore</option>
                                  <option>Hyderabad</option>
                                  <option>Chennai</option>
                                  <option>Kashmir</option>
                                  <option>Kolkata</option>
                                  <option>Gujarat</option>
                                  <option>Rajasthan</option>
                                  <option>Punjab</option>
                                  <option>Delhi</option>
                                  <option>Goa</option>
              </select></h3></label>
     
        <label> <h3>Destination:   <select name="destination" id="destination"required>
        							<option value=" ">Select a city</option>
                                  <option>Pune</option>
                                  <option>Mumbai</option>
                                  <option>Bangalore</option>
                                  <option>Hyderabad</option>
                                  <option>Chennai</option>
                                  <option>Kashmir</option>
                                  <option>Kolkata</option>
                                  <option>Gujarat</option>
                                  <option>Rajasthan</option>
                                  <option>Punjab</option>
                                  <option>Delhi</option>
                                  <option>Goa</option>
              </select></h3></label><br>
         <h3>Departure Date: <input type=date id=departure_date placeholder="Date" name="departure_date"required></h3>
          <h3>Return Date: <input type=date id=return_date placeholder="Date" name="return_date"required></h3>
         <h3>Capacity: <input type="text" id="capacity" name="capacity"required></h3>
            
        
       
         
      <button onclick="bus_details.jsp">BOOK TICKET</button>
 
    </form>
  </div>
</div>
      
    </body>
</html>