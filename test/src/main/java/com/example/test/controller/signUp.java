package com.example.test.controller;

import com.example.test.beans.User;
import com.example.test.model.UserDbModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name= "signUp", urlPatterns = {"/signUp"})
public class signUp extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        if(new UserDbModel().signUp(user)) {
            System.out.println(email);
            System.out.println(password);
        }
        else {
            resp.sendRedirect(req.getContextPath() + "/profile_page.jsp");
        }
    }
}
