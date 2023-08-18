package com.example.test.controller;


import com.example.test.beans.User;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="deletediet", urlPatterns = {"/adddietlist"})
public class deletediet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws IOException {

        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("email");
        if( user == null) {
            response.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }
        int dietlistid = Integer.parseInt(req.getParameter("list_id"));


    }

}
