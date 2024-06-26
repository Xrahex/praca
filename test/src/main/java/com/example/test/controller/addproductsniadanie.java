package com.example.test.controller;


import com.example.test.beans.Product;
import com.example.test.beans.User;
import com.example.test.model.DietModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "add_product_sniadanie", urlPatterns = {"/addproductsnaidanie"})
public class addproductsniadanie extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("email");
        if(user == null) {
            response.sendRedirect(req.getContextPath() + "/signin.jsp");
        }
        Product product = new Product();
        String productname = req.getParameter("productname");
        String calorie = req.getParameter("calorie");
        String listid = req.getParameter("list_id");
        String poradnia = req.getParameter("poradnia");
        String bialko = req.getParameter("bialko");
        String weglowodany = req.getParameter("weglowodany");
        String tluszcz = req.getParameter("tluszcz");
        String kwasy_tluszczowe = req.getParameter("kwasy_tluszczowe");
        String blonnik = req.getParameter("blonnik");
        String sol = req.getParameter("sol");
        String cukry = req.getParameter("cukry");
        String czas = req.getParameter("czas_przygotowania");
        String zawiera_laktoze = req.getParameter("zawiera_laktoze");
        String zawiera_gluten = req.getParameter("zawiera_gluten");
        String jest_wegetarianski = req.getParameter("jest_wegetarianski");
        String jest_weganski = req.getParameter("jest_weganski");

        product.setDiet_list_id(Integer.parseInt(listid));
        product.setName(productname);
        product.setCalorie(Integer.valueOf(calorie));
        product.setPoradnia(Integer.parseInt(poradnia));
        product.setBialko(Double.parseDouble(bialko));
        product.setWeglowodany(Double.parseDouble(weglowodany));
        product.setTluszcz(Double.parseDouble(tluszcz));
        product.setKwasy_tluszczowe(Double.parseDouble(kwasy_tluszczowe));
        product.setBlonnik(Double.parseDouble(blonnik));
        product.setSol(Double.parseDouble(sol));
        product.setCukry(Double.parseDouble(cukry));
        product.setCzas_przygotownia(Integer.parseInt(czas));
        product.setLaktoza(Integer.parseInt(zawiera_laktoze));
        product.setGluten(Integer.parseInt(zawiera_gluten));
        product.setWegetarian(Integer.parseInt(jest_wegetarianski));
        product.setWege(Integer.parseInt(jest_weganski));
        new DietModel().createdietproductsniadanie(product);

        response.sendRedirect(req.getContextPath() + "/dietlistdetails?list_id="+listid);

    }
}
