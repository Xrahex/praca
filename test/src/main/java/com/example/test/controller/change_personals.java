package com.example.test.controller;

import com.example.test.beans.User;
import com.example.test.model.UserDbModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.rmi.ServerException;
import java.sql.SQLException;


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
        String wybor = req.getParameter("wybor");

        double PPM=0.0;


        if(plec=="kobieta") {
            PPM = 665.09 + (9.56 * akt_waga) + (1.85 * wzrost) - (4.67 * wiek);
        }
        else {
            PPM = 66.47 + (13.75 * akt_waga) + (5 * wzrost) - (6.75 * wiek);
        }

        double[][] PAL = {
                {1.4, 1.5, 1.6, 1.7},
                {1.5, 1.6, 1.7, 1.8},
                {1.6, 1.7, 1.8, 1.9},
                {1.7, 1.8, 1.9, 2.1},
                {1.9, 2.0, 2.2, 2.3}
        };

       double yoursPAL = PAL[aktywnosc_fizyczna][aktywnosc_fizyczna2];
       double CPM = PPM*yoursPAL;

//        try {
//            // new UserDbModel().change_personals(user,username,imie,nazwisko);
//            System.out.println(imie);
//            getServletContext().getRequestDispatcher("/panel.jsp").forward(req,response);
//        }
//        catch(SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
    }
}
