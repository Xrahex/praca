package com.example.test.controller;

import com.example.test.beans.DietList;
import com.example.test.beans.User;
import com.example.test.model.UserDbModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.rmi.ServerException;
import java.sql.SQLException;
import java.util.List;


@WebServlet(name = "changepersonals", urlPatterns = {"/changepersonals"})
public class change_personals extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServerException, IOException, ServletException {
        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("email");
        String imie = req.getParameter("firstName");
        String nazwisko = req.getParameter("lastName");
        String plec = req.getParameter("plec");
        double akt_waga = Double.parseDouble(req.getParameter("aktualna_waga"));
        double doc_waga = Double.parseDouble(req.getParameter("waga_docelowa"));
        int wzrost = Integer.parseInt(req.getParameter("wzrost"));
        int wiek = Integer.parseInt(req.getParameter("wiek"));
        int aktywnosc_fizyczna = Integer.parseInt(req.getParameter("aktywnosc_fizyczna"));
        int aktywnosc_fizyczna2 = Integer.parseInt(req.getParameter("aktywnosc_fizyczna2"));
        int wybor = Integer.parseInt(req.getParameter("wybor"));

        double PPM = 0.0;

        System.out.println(plec);
        System.out.println(akt_waga);
        System.out.println(doc_waga);
        System.out.println(wzrost);
        System.out.println(wiek);
        System.out.println(aktywnosc_fizyczna);
        System.out.println(aktywnosc_fizyczna2);
        System.out.println(wybor);


        if (plec == "kobieta") {
            PPM = 665.09 + (9.56 * akt_waga) + (1.85 * wzrost) - (4.67 * wiek);
        } else {
            PPM = 66.47 + (13.75 * akt_waga) + (5 * wzrost) - (6.75 * wiek);
        }

        System.out.println(PPM);
        double[][] PAL = {
                {1.4, 1.5, 1.6, 1.7},
                {1.5, 1.6, 1.7, 1.8},
                {1.6, 1.7, 1.8, 1.9},
                {1.7, 1.8, 1.9, 2.1},
                {1.9, 2.0, 2.2, 2.3}
        };

        double yoursPAL = PAL[aktywnosc_fizyczna2][aktywnosc_fizyczna];
        double CPM = PPM * yoursPAL;
        double CPM1=CPM;
        double CPM2=CPM;
        System.out.println(CPM);
        if (wybor == 0) {
             CPM1 = CPM - 300;
             CPM2 = CPM - 200;
        } else if (wybor == 1) {
            CPM1 = CPM + 200;
            CPM2 = CPM + 300;
        }
        System.out.println(CPM1);
        System.out.println(CPM2);
        try {
            new UserDbModel().updateuserCPM(user.getId(),CPM);
            new UserDbModel().change_personals(user,imie,nazwisko,akt_waga,wzrost,wiek);
            List<DietList> dietsforyou = new UserDbModel().finddiets(CPM1,CPM2);
            req.setAttribute("dietydlaciebie",dietsforyou);
            System.out.println(dietsforyou.size());
            int id=dietsforyou.get(0).getDiet_list_id();
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dietydlaCiebie.jsp");
            dispatcher.forward(req,response);
        }
        catch(SQLException e) {
            e.printStackTrace();
        }
    }
    }

