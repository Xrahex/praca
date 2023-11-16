package com.example.test.controller;

import com.example.test.beans.User;
import com.example.test.model.DietModel;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="deletesaveddiet", urlPatterns = {"/deletesaveddiet"})
public class deletesaveddiet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws IOException {

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("email");
        if( user == null) {
            response.sendRedirect(req.getContextPath() + "/signin.jsp");
            return;
        }
        int dietlistid = Integer.parseInt(req.getParameter("list_id"));
        int user_id = user.getId();

        boolean isdietlistdeleted = new DietModel().deletesavedDiettbyid(dietlistid,user_id);
        response.sendRedirect(req.getContextPath() + "/zapisanediety.jsp");


    }

}