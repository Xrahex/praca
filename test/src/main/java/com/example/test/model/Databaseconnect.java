package com.example.test.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Databaseconnect {

    Connection connection = null;
    final private String url;
    final private String user;
    final private String password;



    public Databaseconnect() {
        url = "jdbc:mariadb://localhost/calicounter";
        user = "root";
        password =  "root";
    }

    public Connection openConnection() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
            return connection;
        }
        catch(ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean closeConnection() {
        try {
            connection.close();
            return true;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
