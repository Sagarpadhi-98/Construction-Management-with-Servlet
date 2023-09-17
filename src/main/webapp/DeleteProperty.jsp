<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String propertyname = request.getParameter("propertyname");
	
	

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction", "root", "root");
		String sql = "delete from property where propertyname='"+propertyname+"'";
		Statement st=con.createStatement();
		
		st.executeUpdate(sql);
response.sendRedirect("PropertyDetails.jsp");
	
		con.close();

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>
</body>
</html>