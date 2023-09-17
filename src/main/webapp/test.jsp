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
<title>View property Details</title>
<style type="text/css">
 *{
            margin: 0;
            padding: 0;
             box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
         .header{
            position: fixed;
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
        .home{
            height: 100vh;
           
            display: flex;
            align-items: center;
            padding: 40px;
        }
        
         .logo{
            font-size: 25px;
            color: #00abf0;
            text-decoration: none;
            font-weight: 600;
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
 
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");
	String sql="select * from property where propertyname='"+propertyname+"'";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(sql);%>
	
	<table style="width:90%; padding: 25px;"  >   
	
	
	
	
	
	<%
	while(rs.next())
	{
		%>
		<tr style="text-align: center;">
		<td><h2><%=rs.getString(1) %></h2></td>
		</tr>
		
		<tr>
		<td><img src="images/<%=rs.getString(2) %>"></td>
		<td><h4>About this property:-</h4><br><%=rs.getString(6) %></td>
		</tr>
		
		<tr>
		<td><b>Location:-</b><%=rs.getString(4) %></td>
		<td ><button style="text-align: center;
                cursor: pointer;
                padding: 13px 50px;
                border: 0;
                border-radius:5px ; font-size: 17px;
                background: #00d301;
                background: -webkit-linear-gradient(-196deg,#00d301,#36c275 50%,#00a562);
                background: -webkit-linear-gradient(164deg,#00d301,#36c275 50%,#00a562);
                background: linear-gradient(286deg,#00d301,#36c275 50%,#00a562);
                line-height: 30px;
                font-weight: 800;
                transition: background,color .1s ease-in-out;"><a style="text-decoration: none;color: black" href="UpdateProperty.jsp?propertyname=<%=rs.getString(1) %>"  >Update</a></button></td>
		<td><button style="cursor: pointer;
                padding: 13px 50px;
                border: 0;
                border-radius:5px ; 
                font-size: 17px;
                background: #00d301;
                background-image: linear-gradient(to right,#e052a0,#f15c41)!important;
                line-height: 30px;
                font-weight: 800;
                transition: background,color .1s ease-in-out;><a style="text-decoration: none; color: white" href="DeleteProperty.jsp?propertyname=<%=rs.getString(1) %>"  >Delete</a></button></td>
		</tr>
		
		<tr>
		<td><b>price:-</b><%=rs.getInt(5) %></td>
		</tr>
		
		<%
		}
		%>
	</table>
	<% 
	con.close();
}
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
</html>