package com.ajaxex4csprog;

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

@WebServlet("/Servlet1")
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Servlet1() {super();}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/report?useSSL=false","root","password");   
			PreparedStatement ps=con.prepareStatement("select * from MyTable");  
			ResultSet rs=ps.executeQuery();  
			
			out.println("<br>");
			out.println("<html><head><title>Table</title></head><body><table style=\"border:2px solid gray;text-align:center;\">");
			out.println("<tr style=\"border:1px solid silver;padding:3px;\"><th style=\"border:1px solid silver;padding:3px;\">dateTime</th><th style=\"border:1px solid silver;padding:3px;\">ramUsed</th><th style=\"border:1px solid silver;padding:3px;\">diskUsed</th><th style=\"border:1px solid silver;padding:3px;\">cpuUsed</th></tr>");
			while(rs.next()){  
				out.println("<tr style=\"border:1px solid silver;padding:3px;\">");
				//out.println(rs.getFloat(1)+" "+rs.getFloat(2)+" "+rs.getDouble(3)+" "+rs.getString(4)+"<br/>");
				out.println("<td style=\"border:1px solid silver;padding:3px;\">"+rs.getString(4)+"</td>");
				out.println("<td style=\"border:1px solid silver;padding:3px;\">"+rs.getFloat(1)+"</td>");
				out.println("<td style=\"border:1px solid silver;padding:3px;\">"+rs.getFloat(2)+"</td>");
				out.println("<td style=\"border:1px solid silver;padding:3px;\">"+rs.getDouble(3)+"</td>");
				out.println("</tr>");
			}  
			out.println("</table></body></html>");
			
			con.close();
			ps.close();
			rs.close();
		}catch(Exception e){
			out.print(e);
		} 
		
	}

}
