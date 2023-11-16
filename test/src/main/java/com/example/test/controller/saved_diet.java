package com.example.test.controller;

import com.example.test.beans.DietList;
import com.example.test.beans.User;
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

@WebServlet(name="saveddiet", urlPatterns = {"/saveddiet"})
public class saved_diet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServerException, IOException, ServletException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("email");
        int id_user = user.getId();
        List<DietList> saved_diets = new DietModel().saved_diets(id_user);
        System.out.println(saved_diets.size());
        req.setAttribute("zapisanediety", saved_diets);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zapisanediety.jsp");
        dispatcher.forward(req, response);
    }
}