package com.example.test.controller;

import com.example.test.beans.DietList;
import com.example.test.beans.Product;
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

@WebServlet(name = "proponowane_produkty", urlPatterns = {"/proponowane_produkty"})
public class proponowane_produkty extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServerException, IOException, ServletException {
        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("email");
        int id_diet = Integer.parseInt(req.getParameter("list_id"));
        double calorie = Double.parseDouble(req.getParameter("calorie"));
        double twoje_calorie = new DietModel().calorie_w_diecie(user.getId());
        List<Product> proponowane_produkty=new DietModel().proponowane_produkty(twoje_calorie,calorie);
        req.setAttribute("proponowane_produkty",proponowane_produkty);
        System.out.println(calorie);
        System.out.println(twoje_calorie);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/proponowane_produkty.jsp");
        dispatcher.forward(req,response);
    }
}
