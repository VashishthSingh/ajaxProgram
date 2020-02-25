package com.ajaxexam3jquery;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetUserServlet1")
public class GetUserServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetUserServlet1() {super(); }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("myName");
		String userName = request.getParameter("myUserName");
		String password = request.getParameter("myPassword");
		if(userName == null || "".equals(userName)) {
			userName = "Guest";
		}
		String greetings = "Hello "+name+" "+userName+" "+password;
		response.setContentType("text/plain");
		response.getWriter().println(greetings);
	}
}
