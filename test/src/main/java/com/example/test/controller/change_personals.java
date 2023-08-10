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


@WebServlet(name = "changepersonals", urlPatterns = {"/changepersonals"})
public class change_personals extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServerException, IOException, ServletException {
        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("email");
        String username = req.getParameter("username");
        String imie = req.getParameter("firstName");
        String nazwisko = req.getParameter("lastName");
        try {
            new UserDbModel().change_personals(user,username,imie,nazwisko);
            System.out.println(imie);
            getServletContext().getRequestDispatcher("/panel.jsp").forward(req,response);
        }
        catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
