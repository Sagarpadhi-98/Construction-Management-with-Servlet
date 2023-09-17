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
<title>Add new property</title>
<style type="text/css">
 *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
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
        .home{
            height: 100vh;
           
            display: flex;
            align-items: center;
            padding: 0 20%;
        }
        .home-content{
           max-width: 80%;
        }
         .logo{
            font-size: 25px;
            color: #00abf0;
            text-decoration: none;
            font-weight: 600;
        }
        button {
	
                display: inline-block;
                outline: 0;
                border: 0;
                cursor: pointer;
                will-change: box-shadow,transform;
                background: radial-gradient( 100% 100% at 100% 0%, #89E5FF 0%, #5468FF 100% );
                box-shadow: 0px 2px 4px rgb(45 35 66 / 40%), 0px 7px 13px -3px rgb(45 35 66 / 30%), inset 0px -3px 0px rgb(58 65 111 / 50%);
                padding: 0 32px;
                border-radius: 6px;
                color: #fff;
                height: 48px;
                font-size: 18px;
                text-shadow: 0 1px 0 rgb(0 0 0 / 40%);
                transition: box-shadow 0.15s ease,transform 0.15s ease;
                :hover {
                    box-shadow: 0px 4px 8px rgb(45 35 66 / 40%), 0px 7px 13px -3px rgb(45 35 66 / 30%), inset 0px -3px 0px #3c4fe0;
                    transform: translateY(-2px);
                }
                :active{
                    box-shadow: inset 0px 3px 7px #3c4fe0;
                    transform: translateY(2px);
                }
                
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
String name=request.getParameter("propertyname");

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");
	String sql="select * from property";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(sql);%>
	
	<table  style="width: 200%; padding: 8px; border-spacing: 30px;"> 
	<tr  style="text-align: center; font-size: 30px">
	<th>Property Name<hr></th>
	
	</tr>
	
	
	
	
	<%
	while(rs.next())
	{
		%>
		<tr style="text-align: center; font-size: 25px">
		<td><%=rs.getString(1) %></td>
		<td ><a style="text-decoration: none;" href="test.jsp?propertyname=<%=rs.getString(1)%>" ><button>view </button></a></td>
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