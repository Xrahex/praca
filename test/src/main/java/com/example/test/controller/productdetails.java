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
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name = "show_diet_list_details", urlPatterns = {"/dietlistdetails"})
public class productdetails extends HttpServlet {

    DietModel dietModel = new DietModel();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
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
            BigDecimal licznik_bialko = new DietModel().count(dietlistid,"bialko");
            BigDecimal licznik_weglowodany = new DietModel().count(dietlistid,"weglowodany");
            BigDecimal licznik_tluszcz = new DietModel().count(dietlistid,"tluszcz");
            BigDecimal licznik_kwasy_tluszczowe = new DietModel().count(dietlistid,"kwasy_tluszczowe");
            BigDecimal licznik_blonnik = new DietModel().count(dietlistid,"blonnik");
            BigDecimal licznik_sol = new DietModel().count(dietlistid,"sol");
            BigDecimal licznik_cukry = new DietModel().count(dietlistid,"cukry");
            int licznik_czas_przygotowania = new DietModel().wybory(dietlistid,"czas_przygotowania");
            int licznik_laktoza = new DietModel().wybory(dietlistid,"laktoza");
            int licznik_gluten = new DietModel().wybory(dietlistid,"gluten");
            int licznik_wegetarian = new DietModel().wybory(dietlistid,"wegetarian");
            int licznik_wege = new DietModel().wybory(dietlistid,"wege");
            System.out.println(licznik_calorie);
            System.out.println(licznik_bialko);
            new DietModel().updateDietcaloriebyid(dietlistid,licznik_calorie);
            new DietModel().updateDietelementbyid(dietlistid,licznik_bialko,"bialko");
            new DietModel().updateDietelementbyid(dietlistid,licznik_weglowodany,"weglowodany");
            new DietModel().updateDietelementbyid(dietlistid,licznik_tluszcz,"tluszcz");
            new DietModel().updateDietelementbyid(dietlistid,licznik_kwasy_tluszczowe,"kwasy_tluszczowe");
            new DietModel().updateDietelementbyid(dietlistid,licznik_blonnik,"blonnik");
            new DietModel().updateDietelementbyid(dietlistid,licznik_sol,"sol");
            new DietModel().updateDietelementbyid(dietlistid,licznik_cukry,"cukry");
            new DietModel().updateDietwyborybyid(dietlistid,licznik_czas_przygotowania,"czas_przygotowania");
            new DietModel().updateDietwyborybyid(dietlistid,licznik_laktoza,"laktoza");
            new DietModel().updateDietwyborybyid(dietlistid,licznik_gluten,"gluten");
            new DietModel().updateDietwyborybyid(dietlistid,licznik_wegetarian,"wegetarianski");
            new DietModel().updateDietwyborybyid(dietlistid,licznik_wege,"wege");
            req.setAttribute("dietlist",dietList);
            req.setAttribute("dietwithproducts",product);
            req.setAttribute("dietwithproducts1",sniadanie);
            req.setAttribute("dietwithproducts2",przekaska);
            req.setAttribute("dietwithproducts3",obiad);
            req.setAttribute("dietwithproducts4",podwieczorek);
            req.setAttribute("dietwithproducts5",kolacja);
            req.setAttribute("liczbacalorie",licznik_calorie);
            req.setAttribute("liczbabialko",licznik_bialko);
            req.setAttribute("liczbaweglowodany",licznik_weglowodany);
            req.setAttribute("liczbatluszcz",licznik_tluszcz);
            req.setAttribute("liczbakwasy_tluszczowe",licznik_kwasy_tluszczowe);
            req.setAttribute("liczbablonnik",licznik_blonnik);
            req.setAttribute("liczbasol",licznik_sol);
            req.setAttribute("liczbacukry",licznik_cukry);
        }
        catch (NumberFormatException e) {
            req.setAttribute("dietlist",null);
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/diet_details2.jsp");
        dispatcher.forward(req,response);
    }
}
