package ConstructionValidation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.protocol.Resultset;

@WebServlet("/login")
public class LoginValidation extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction", "root", "root");
			String sql = "select * from signup where email = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			PrintWriter pw = resp.getWriter();

			if (rs.next()) {
				pw.write("<h2>Login Successful</h2>");
				session.setAttribute("name", rs.getString("email"));
				RequestDispatcher rd = req.getRequestDispatcher("home.html");
				rd.forward(req, resp);

			}

			else {
				pw.write("<html><body>");
				pw.write("<h2 style='color:red;'>Wrong username & password ! try again !</h2>");
				pw.write("</html></body>");
				RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
				rd.include(req, resp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
