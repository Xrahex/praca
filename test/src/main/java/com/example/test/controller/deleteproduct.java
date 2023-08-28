package com.example.test.controller;
import com.example.test.beans.User;
import com.example.test.model.DietModel;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet(name="deleteproduct", urlPatterns = {"/deleteproduct"})
public class deleteproduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws IOException {

        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("email");
        if (user == null) {
            response.sendRedirect(req.getContextPath() + "/signin.jsp");
            return;
        }
        int product_id = Integer.parseInt(req.getParameter("product_id"));
        System.out.println(product_id);
        String listid = req.getParameter("list_id");

        boolean isdietlistdeleted = new DietModel().deleteproductbyid(product_id);

        response.sendRedirect(req.getContextPath() + "/dietlistdetails?list_id="+listid);


    }
}

