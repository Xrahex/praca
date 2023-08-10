package com.example.test.model;

import com.example.test.beans.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DietModel {

    Connection connect;
    Databaseconnect dbConnection = new Databaseconnect();


    public boolean addProduct(Product product) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("INSERT into products(product_name,calorie) values (?,?)");
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getCalorie());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            dbConnection.closeConnection();
            e.printStackTrace();
        }
        return false;
    }
}