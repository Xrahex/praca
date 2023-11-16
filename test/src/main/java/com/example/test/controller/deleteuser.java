package com.example.test.controller;

import com.example.test.beans.User;
import com.example.test.model.AdminDbModel;
import com.example.test.model.DietModel;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="deleteuser", urlPatterns = {"/deleteuser"})
public class deleteuser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws IOException {

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("email");
        if( user == null) {
            response.sendRedirect(req.getContextPath() + "/signin.jsp");
            return;
        }

        int userid = Integer.parseInt(req.getParameter("id"));

        boolean isdietlistdeleted = new AdminDbModel().deleteuserbyid(userid);
        response.sendRedirect(req.getContextPath() + "/allusers");


    }

}