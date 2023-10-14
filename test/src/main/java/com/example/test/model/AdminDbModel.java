package com.example.test.model;

import com.example.test.beans.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDbModel {

    Connection connect;
    Databaseconnect dbConnection = new Databaseconnect();




    public List<User> allusers() {
        List<User> allusers = new ArrayList<>();
        try{
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("SELECT * FROM user");
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                allusers.add(user);
            }
            }
        catch (Exception e) {
            e.printStackTrace();
        }
        return allusers;
    }
}
