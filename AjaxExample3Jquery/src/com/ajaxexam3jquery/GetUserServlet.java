package com.ajaxexam3jquery;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetUserServlet")
public class GetUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetUserServlet() {super(); }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String comment = request.getParameter("comment");
		String email = request.getParameter("email");
		PrintWriter out=response.getWriter();
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/report?useSSL=false","root","password");   
			PreparedStatement ps=con.prepareStatement("insert into usercomment(comment,email) values(?,?)");  
			ps.setString(1,comment);  
			ps.setString(2,email);  
			ps.executeUpdate();  
			ps.close();
			
			PreparedStatement ps2=con.prepareStatement("select * from usercomment");  
			ResultSet rs=ps2.executeQuery();  
			response.setContentType("text/plain");

			while(rs.next()){  
				comment=rs.getString(1);
				email=rs.getString(2);
				out.println(comment+" "+email);
			}  
			con.close();
			ps.close();
			ps2.close();
			rs.close();
		}catch(Exception e){
			out.print(e);
		}  
	}
}
