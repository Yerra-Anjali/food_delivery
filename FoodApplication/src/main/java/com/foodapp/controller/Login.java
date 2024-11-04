package com.foodapp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.daoImpl.UserDAOImpl;
import com.foodapp.dto.User;


public class Login extends HttpServlet {
		private HttpSession session;

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) 
				throws ServletException, IOException 
		{
			String email = req.getParameter("email");
			String psw = req.getParameter("password");
			UserDAOImpl udaoimpl = new UserDAOImpl();
			
			User user = udaoimpl.getUserByEmail(email);
			if (user != null) 
			{
				if (psw.equals(user.getPassword())) 
				{
					 
					session=req.getSession();
					session.setAttribute("user",user);
					System.out.println(user);
					// Inside the first servlet
					RequestDispatcher rd = req.getRequestDispatcher("/home.jsp");
					rd.forward(req, resp);
				} 
				else 
				{
					resp.sendRedirect(req.getContextPath() + "/incorrect.html"); // Correct redirection for incorrect password
				}
			} 
			else 
			{
				resp.sendRedirect(req.getContextPath() + "/RegisterPage.html"); // Should probably be a registration or "user not found" page
			}
			
		}
	
	

}