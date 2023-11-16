package com.example.test.controller;

import com.example.test.beans.User;
import com.example.test.model.UserDbModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.rmi.ServerException;
import java.sql.SQLException;

@WebServlet(name = "changepassword", urlPatterns = {"/changepassword"})
public class change_password extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServerException, IOException, ServletException {
        String password = req.getParameter("password");
        String password2= req.getParameter("password2");
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("email");
        System.out.println(password);
        System.out.println(password2);
        try {
            new UserDbModel().change_password(user,password,password2);
            System.out.println(user.getEmail());
           getServletContext().getRequestDispatcher("/login").forward(req,response);
        }
        catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
