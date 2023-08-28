package com.example.test.controller;


import com.example.test.beans.User;
import com.example.test.model.DietModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="modifyproduct", urlPatterns = {"/modifyproduct"})
public class modifyproduct extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = req.getSession(true);
        User user =  (User) session.getAttribute("email");
        if(user == null) {
            response.sendRedirect("/signin.jsp");
            return;
        }

        int listid = Integer.parseInt(req.getParameter("list_id"));
        int calorie = Integer.parseInt(req.getParameter("calorie"));
        int product_id = Integer.parseInt(req.getParameter("product_id"));
        String name = req.getParameter("name");

        boolean isDietlistupdated = new DietModel().updateproductbyid(product_id,name,calorie);

        response.sendRedirect(req.getContextPath() + "/dietlistdetails?list_id="+listid);

    }
}
