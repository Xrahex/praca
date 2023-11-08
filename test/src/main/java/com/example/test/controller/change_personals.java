package com.example.test.controller;

import com.example.test.beans.DietList;
import com.example.test.beans.Profile;
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
        int liczba_posilkow = Integer.parseInt(req.getParameter("liczba_posilki"));
        int czas_posilkow = Integer.parseInt(req.getParameter("czas_posilki"));
        int preferencje = Integer.parseInt(req.getParameter("preferencje"));

        double PPM = 0.0;

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
            new UserDbModel().change_personals(user,imie,nazwisko,akt_waga,wzrost,wiek,plec,liczba_posilkow,czas_posilkow,preferencje);
            String preferencje_uzytkownika = null;
            switch (preferencje) {
                case 1:
                    preferencje_uzytkownika="laktoza";
                    break;
                case 2:
                    preferencje_uzytkownika="gluten";
                    break;
                case 3:
                    preferencje_uzytkownika="wegetarian";
                    break;
                case 4:
                    preferencje_uzytkownika="wege";
            }
            Profile profile = new UserDbModel().select_profile(user);
            List<DietList> dietsforyou = new UserDbModel().finddiets(CPM1,CPM2,czas_posilkow,preferencje_uzytkownika);
            req.setAttribute("dietydlaciebie",dietsforyou);
            session.setAttribute("profil",profile);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dietydlaCiebie.jsp");
            dispatcher.forward(req,response);
        }
        catch(SQLException e) {
            e.printStackTrace();
        }
    }
    }

