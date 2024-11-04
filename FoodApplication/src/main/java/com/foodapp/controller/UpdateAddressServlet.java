package com.foodapp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodapp.daoImpl.UserDAOImpl;
import com.foodapp.dto.User;



public class UpdateAddressServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                String newAddress = req.getParameter("address");
                UserDAOImpl userDao = new UserDAOImpl();
                userDao.updateUserById(user.getUser_id(), newAddress);  // Update the address

                user.setAdress(newAddress);  // Update the user object in the session
                session.setAttribute("user", user);

                resp.sendRedirect("Account.jsp");  // Redirect back to account page
            } else {
                resp.sendRedirect("LoginPage.html");
            }
        } else {
            resp.sendRedirect("LoginPage.html");
        }
    }
}