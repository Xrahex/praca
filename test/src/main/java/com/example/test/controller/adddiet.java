package com.example.test.controller;

import com.example.test.beans.DietList;
import com.example.test.beans.User;
import com.example.test.model.DietModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "add_diet_listy", urlPatterns = {"/adddietlist"})
public class adddiet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("email");
        if(user == null) {
            response.sendRedirect(req.getContextPath() + "/signin.jsp");
        }
        DietList dietList= new DietList();
        dietList.setId_user(user.getId());
        String listname = req.getParameter("listName");
        dietList.setName(listname);
        new DietModel().createdietlist(dietList);

        response.sendRedirect(req.getContextPath() + "/alldiets");
    }
}