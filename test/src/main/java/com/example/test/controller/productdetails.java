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
import java.util.List;

@WebServlet(name = "show_diet_list_details", urlPatterns = {"/dietlistdetails"})
public class productdetails extends HttpServlet {

    DietModel dietModel = new DietModel();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("email");
        if(user == null) {
            response.sendRedirect(req.getContextPath() + "/signin.jsp");
            return;
        }

        try {
            int dietlistid = Integer.parseInt(req.getParameter("list_id"));
            DietList dietList = dietModel.searchDietListByListid(dietlistid);
            List<Product>  product=new DietModel().getproductsfromdiet(dietlistid);
            List<Product> sniadanie = new DietModel().getproductsfromdiet1(dietlistid,1);
            List<Product> przekaska = new DietModel().getproductsfromdiet1(dietlistid,2);
            List<Product> obiad = new DietModel().getproductsfromdiet1(dietlistid,3);
            List<Product> podwieczorek = new DietModel().getproductsfromdiet1(dietlistid,4);
            List<Product> kolacja = new DietModel().getproductsfromdiet1(dietlistid,5);
            int licznik_calorie = new DietModel().caloriecount(dietlistid);
            int licznik_bialko = new DietModel().bialkocount(dietlistid);
            System.out.println(licznik_calorie);
            System.out.println(licznik_bialko);
            new DietModel().updateDietcaloriebyid(dietlistid,licznik_calorie);
            new DietModel().updateDietbialkobyid(dietlistid,licznik_bialko);
            req.setAttribute("dietlist",dietList);
            req.setAttribute("dietwithproducts",product);
            req.setAttribute("dietwithproducts1",sniadanie);
            req.setAttribute("dietwithproducts2",przekaska);
            req.setAttribute("dietwithproducts3",obiad);
            req.setAttribute("dietwithproducts4",podwieczorek);
            req.setAttribute("dietwithproducts5",kolacja);
            req.setAttribute("liczbacalorie",licznik_calorie);
            req.setAttribute("liczbabialko",licznik_bialko);
        }
        catch (NumberFormatException e) {
            req.setAttribute("dietlist",null);
        }


        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/diet_details2.jsp");
        dispatcher.forward(req,response);
    }
}
