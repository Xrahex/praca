package com.example.test.controller;

import com.example.test.beans.Product;
import com.example.test.model.DietModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.rmi.ServerException;


@WebServlet(name = "addproduct", urlPatterns = {"/addproduct"})
public class addproduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServerException, IOException, ServletException {
        String name = req.getParameter("productname");
        int calorie = Integer.valueOf(req.getParameter("calorie"));
        double bialko = Double.parseDouble(req.getParameter("bialko"));
        Product product = new Product();
        product.setName(name);
        product.setCalorie(calorie);
        product.setBialko(bialko);
        if(new DietModel().addProduct(product)) {
            System.out.println("hej");
        }
        else {
            System.out.println("działa");
        }
    }
}
