package ConstructionValidation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/signup")
public class SignUpValidation extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String name=req.getParameter("name");
		String dob=req.getParameter("dob");
		long phone=Long.parseLong(req.getParameter("phone"));
		String password=req.getParameter("password");
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");
			String sql="insert into signup values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, name);
			ps.setString(3, dob);
			ps.setLong(4, phone);
			ps.setString(5, password);
			
			
			 ps.execute();
			 
			 PrintWriter pw=resp.getWriter();
				pw.write("<html><body><h2>Data Enter Success</h2></body></html>");
				RequestDispatcher rsd=req.getRequestDispatcher("Login.jsp");
				rsd.include(req, resp);
				con.close();
			
		} catch (ClassNotFoundException e) {
			PrintWriter pw=resp.getWriter();
			pw.write("<html><body><h2 style='color:red'>Wrong Input</h2></body></html>");
			RequestDispatcher rsd=req.getRequestDispatcher("SignUp.html");
			rsd.include(req, resp);
			e.printStackTrace();
		} catch (SQLException e) {
			PrintWriter pw=resp.getWriter();
			pw.write("<html><body><h2 style='color:red'>Wrong Input</h2></body></html>");
			RequestDispatcher rsd=req.getRequestDispatcher("SignUp.html");
			rsd.include(req, resp);
			e.printStackTrace();
		}
	}

}
