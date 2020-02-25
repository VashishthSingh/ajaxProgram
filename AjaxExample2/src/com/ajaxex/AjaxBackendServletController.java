package com.ajaxex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AjaxBackendServletController")
public class AjaxBackendServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AjaxBackendServletController() {super();}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comment=request.getParameter("comment"); 
		String email=request.getParameter("email"); 
		
		PrintWriter out=response.getWriter();
		out.println(comment+" "+email);
		out.println("Success..");
	}

}
