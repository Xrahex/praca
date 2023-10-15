package com.example.test.controller;

import com.example.test.beans.DietList;
import com.example.test.beans.Product;
import com.example.test.beans.User;
import com.example.test.model.AdminDbModel;
import com.example.test.model.DietModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.List;

@WebServlet(name = "allusers", urlPatterns = {"/allusers"})
public class allusers extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServerException, IOException, ServletException {
        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("email");
        int id_user = user.getId();
        List<User> allusers= new AdminDbModel().allusers();
        System.out.println(allusers.size());
        req.setAttribute("showallusers",allusers);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/allusers.jsp");
        dispatcher.forward(req,response);
    }
}