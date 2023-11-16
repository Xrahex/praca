package com.example.test.controller;


import com.example.test.beans.Product;
import com.example.test.beans.User;
import com.example.test.model.DietModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "add_product_proponowany", urlPatterns = {"/addproductproponowany"})
public class addproductproponowany extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("email");
        if(user == null) {
            response.sendRedirect(req.getContextPath() + "/signin.jsp");
        }
        int product_id= Integer.parseInt(req.getParameter("product_id"));
        int listid = Integer.parseInt(req.getParameter("list_id"));
        Product product = new DietModel().getproductbyid(product_id);
        product.setDiet_list_id(listid);
        product.setPoradnia(1);
        new DietModel().createdietproductsniadanie(product);
        response.sendRedirect(req.getContextPath() + "/dietlistdetails?list_id="+listid);

    }
}
