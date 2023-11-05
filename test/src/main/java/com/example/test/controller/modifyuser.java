package com.example.test.controller;

import com.example.test.beans.User;
import com.example.test.model.AdminDbModel;
import com.example.test.model.DietModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="modifyuser", urlPatterns = {"/modifyuser"})
public class modifyuser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = req.getSession(true);
        User user =  (User) session.getAttribute("email");
        if(user == null) {
            response.sendRedirect("/signin.jsp");
            return;
        }

        int userid = Integer.parseInt(req.getParameter("id"));
        String nickname = req.getParameter("nickname");
        String type = req.getParameter("type");

        boolean isDietlistupdated = new AdminDbModel().updatenicknamebyid(userid,nickname,type);

        response.sendRedirect(req.getContextPath() + "/allusers");


    }
}
