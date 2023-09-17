<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Property Details</title>
<style type="text/css">
*{
            margin: 0;
            padding: 20px;
          box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
form {
  width: 50%;
        margin: 50px auto;
	
}
   .header{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding: 20px 10%;
            background:transparent;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 100;
        }
        .navbar a{
            font-size: 18px;
            color: #ededed;
            text-decoration: none;
            font-weight: 500;
            margin-left: 35px;
            transition: .3s;
        }
        .navbar a:hover,.navbar a.active{
            color: #00abf0;
        
        }
        .logo{
            font-size: 25px;
            color: #00abf0;
            text-decoration: none;
            font-weight: 600;
        }
 
  input{
         display: block;
            padding: 9px;
            border-radius: 15px;
            width:80%;
            margin: 15px;
             
            
            
        }
select{
   display: block;
           padding: 9px;
            border-radius: 15px;
            width:80%;
            margin: 15px;
}
button {
	
                display: inline-block;
                outline: 0;
                text-align: center;
                cursor: pointer;
                padding: 13px 50px;
                border: 0;
                border-radius:5px ;
                color: #fff;
                font-size: 17.5px;
                background: #00d301;
                background: -webkit-linear-gradient(-196deg,#00d301,#36c275 50%,#00a562);
                background: -webkit-linear-gradient(164deg,#00d301,#36c275 50%,#00a562);
                background: linear-gradient(286deg,#00d301,#36c275 50%,#00a562);
                line-height: 30px;
                font-weight: 800;
                transition: background,color .1s ease-in-out;
                
}



</style>
</head>
<body style="background: #081b29;color: #ededed;">

<header class="header">
        <a href="home.html" class="logo">Dream Home.</a>
        <nav class="navbar">
            <a href="home.html" class="active">Home</a>
            <a href="Property.jsp">Add Property</a>
            <a href="PropertyDetails.jsp">View Property</a>
            <a href="Login.jsp">Logout</a>
        </nav>
    </header>
    <section class="home">
        <div class="home-content">
<%
String propertyname=request.getParameter("propertyname");
try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");
	String sql="select * from property where propertyname='"+propertyname+"'";
	Statement st=con.createStatement(); 
	ResultSet rs=st.executeQuery(sql);
	while(rs.next())
	{
%>

<form action="updateservlet" method="post" enctype="multipart/form-data">
<div class="property">


<!-- Property Name: -->
<input type="hidden" name="propertyname" placeholder="Enter your property name" value="<%=rs.getString(1)%>"><br>


<h2>Picture:</h2>
<input type="file" name="picture" accept="image/png, image/jpg, image/jpeg" value="<%=rs.getString(2)%>"><br>

<h2>Location:</h2>
<select name="location" value="<%=rs.getString(4)%>">
<option>Select</option>
<option>Anugul</option>
<option>Balasore</option>
<option>Berhampur</option>
<option>Bhadrak</option>
<option>Bhubaneswar</option>
<option>Baragarh</option>
<option>Bolangir</option>
<option>Cuttack</option>
<option>Dhenkanal</option>
<option>Deogarh</option>
<option>Ganjam</option>
<option>Rourkela</option>
<option>Nayagarh</option>
<option>Khordha</option>
<option>Keonjhar</option>
<option>Sambalpur</option>
<option>Sundargarh</option>
<option>Malakangiri</option>
</select><br>

<h2>Price:</h2>
<input type="number" name="price" placeholder="Enter property price" value="<%=rs.getInt(5)%>"><br>

<h2>Description:</h2>
<input type="text" name="description" placeholder="Add details about property" value="<%=rs.getString(6)%>"><br>

<center>
<button type="submit">Save</button>
</center>

</div>
</form>
<%
	}}
catch (ClassNotFoundException e) {
	e.printStackTrace();
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
</div>
</section>
</body>
</body></html>