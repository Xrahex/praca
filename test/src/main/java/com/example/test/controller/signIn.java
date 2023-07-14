package com.example.test.controller;

import com.example.test.beans.User;
import com.example.test.model.UserDbModel;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.rmi.ServerException;

@WebServlet(name = "signIn", urlPatterns = {"/signIn"})
public class signIn extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServerException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = new UserDbModel().signIn(email,password);
        if(new UserDbModel().signUp(user)) {
            System.out.println(email);
            System.out.println(password);
        }
        else {
            System.out.println("nie działa");
        }
    }
}
