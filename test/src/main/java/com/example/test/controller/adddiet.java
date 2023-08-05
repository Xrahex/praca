package com.example.test.controller;

import com.example.test.beans.User;
import com.example.test.model.UserDbModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.rmi.ServerException;
import java.sql.SQLException;


@WebServlet(name = "adddiet", urlPatterns = {"/adddiet"})
public class adddiet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServerException, IOException, ServletException {
        String name = req.getParameter("productname");
        String calorie = req.getParameter("calorie");
        HttpSession session = req.getSession(true);
        try {
            new UserDbModel().change_personals(user,username,imie,nazwisko);
            getServletContext().getRequestDispatcher("/panel.jsp").forward(req,response);
        }
        catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
