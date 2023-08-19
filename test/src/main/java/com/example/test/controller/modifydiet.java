package com.example.test.controller;


import com.example.test.beans.DietList;
import com.example.test.beans.User;
import com.example.test.model.DietModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="modifydiet", urlPatterns = {"/modifydietlist"})
public class modifydiet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = req.getSession(true);
        User user =  (User) session.getAttribute("email");
        if(user == null) {
            response.sendRedirect("/signin.jsp");
            return;
        }

        int dietlistid = Integer.parseInt(req.getParameter("list_id"));
        String dietname = req.getParameter("name");

        boolean isDietlistupdated = new DietModel().updateDietlistbyid(dietlistid,dietname);

        response.sendRedirect(req.getContextPath() + "/alldiets");


    }
}
