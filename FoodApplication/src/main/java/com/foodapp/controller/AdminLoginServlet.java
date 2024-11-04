package com.foodapp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.daoImpl.AdminDAOImpl;
import com.foodapp.dto.Admin;

public class AdminLoginServlet extends HttpServlet {
	private HttpSession session;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException 
	{
		// Get email and password from the request
		String email = req.getParameter("email");
		String psw = req.getParameter("password");
		
		// Use the AdminDAOImpl to retrieve the admin from the database
		AdminDAOImpl adminDaoImpl = new AdminDAOImpl();
		Admin admin = adminDaoImpl.getUserByEmail(email);

		// Check if the admin exists
		if (admin != null) 
		{
			// Verify if the password matches
			if (psw.equals(admin.getPassword())) 
			{
				// Create a session and store the admin object
				session = req.getSession();
				session.setAttribute("admin", admin);
				
				// Forward to admin home page
				RequestDispatcher rd = req.getRequestDispatcher("/AdminHome.jsp");
				rd.forward(req, resp);
			} 
			else 
			{
				// Redirect to incorrect credentials page
				resp.sendRedirect(req.getContextPath() + "/incorrectAdminLogin.html");
			}
		} 
		else 
		{
			// If admin not found, redirect to registration or error page
			resp.sendRedirect(req.getContextPath() + "/adminRegister.html");
		}
	}
}