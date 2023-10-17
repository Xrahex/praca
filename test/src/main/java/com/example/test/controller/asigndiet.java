package com.example.test.controller;

import com.example.test.beans.DietList;
import com.example.test.beans.Product;
import com.example.test.beans.User;
import com.example.test.model.AdminDbModel;
import com.example.test.model.DietModel;
import com.example.test.model.UserDbModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.rmi.ServerException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "asigndiet", urlPatterns = {"/asigndiet"})
public class asigndiet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServerException, IOException, ServletException {

        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("email");
        if( user == null) {
            response.sendRedirect(req.getContextPath() + "/signin.jsp");
            return;
        }
        int dietlistid = Integer.parseInt(req.getParameter("list_id"));
        try{
            new UserDbModel().asigndiet(user,dietlistid);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        response.sendRedirect(req.getContextPath() + "/alldiets");
    }
}