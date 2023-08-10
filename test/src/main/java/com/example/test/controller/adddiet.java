package com.example.test.controller;

import com.example.test.beans.Product;
import com.example.test.beans.User;
import com.example.test.model.DietModel;
import com.example.test.model.UserDbModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintStream;
import java.rmi.ServerException;
import java.sql.SQLException;


@WebServlet(name = "adddiet", urlPatterns = {"/adddiet"})
public class adddiet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServerException, IOException, ServletException {
        String name = req.getParameter("productname");
        int calorie = Integer.valueOf(req.getParameter("calorie"));
        Product product = new Product();
        product.setName(name);
        product.setCalorie(calorie);
        if(new DietModel().addProduct(product)) {
            System.out.println("hej");
        }
        else {
            System.out.println("działa");
        }
    }
}
