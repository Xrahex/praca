package com.example.test.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DietModel {

    Connection connect;
    Databaseconnect dbConnection = new Databaseconnect();



    public void addProduct() {
        connect = dbConnection.openConnection();
        PreparedStatement preparedStatement = connect.prepareStatement();

    }

}
