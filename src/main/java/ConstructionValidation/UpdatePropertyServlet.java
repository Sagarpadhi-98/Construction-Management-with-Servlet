package ConstructionValidation;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/updateservlet")
@MultipartConfig(fileSizeThreshold = 2000*2000*5,
maxFileSize =2000*2000*10,
maxRequestSize = 2000*2000*50
)
public class UpdatePropertyServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html; charset=ISO-8859-1");
		PrintWriter out = resp.getWriter();
		
		
		String propertyname=req.getParameter("propertyname");
		
		Part file=req.getPart("picture");
		String filename= file.getSubmittedFileName();
		
		String savepath="C:/Users/sagar/OneDrive/Desktop/J2EE/ConstructionManagement/src/main/webapp/images/"+filename;
		
		try {
		FileOutputStream fos=new FileOutputStream(savepath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
	    fos.write(data);
	    fos.close();
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		String location=req.getParameter("location");
		int price = Integer.parseInt(req.getParameter("price"));
		String description=req.getParameter("description");
	
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");
		String sql="update property set filename=?, savepath=?, location=?, price=?, description=? where propertyname='"+propertyname+"'";
		PreparedStatement ps=con.prepareStatement(sql);
		
		ps.setString(1, filename);
		ps.setString(2, savepath);
		ps.setString(3, location);
		ps.setInt(4, price);
		ps.setString(5, description);
		
		ps.setString(6, propertyname);
		
		
		 ps.executeUpdate();
		 
		 PrintWriter pw=resp.getWriter();
			pw.write("<html><body><h2 style='color:green'>Data Enter Success</h2></body></html>");
			RequestDispatcher rsd=req.getRequestDispatcher("Property.jsp");
			rsd.include(req, resp);
			con.close();
		
	}
	catch (Exception e) {
		PrintWriter pw=resp.getWriter();
		pw.write("<html><body><h2 style='color:red'>Wrong Input</h2></body></html>");
		RequestDispatcher rsd=req.getRequestDispatcher("Property.jsp");
		rsd.include(req, resp);
		}
}
}
