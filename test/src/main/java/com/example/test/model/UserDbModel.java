package com.example.test.model;

import com.example.test.beans.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDbModel {

    Connection connect;
    Databaseconnect dbConnection = new Databaseconnect();
    boolean b;


    public boolean signUp(User user) {
        boolean b = false;
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("INSERT into user(email,password) values (?,?)");
            preparedStatement.setString(1,user.getEmail());
            preparedStatement.setString(2,user.getPassword());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        }
        catch(SQLException e) {
            dbConnection.closeConnection();
            e.printStackTrace();
            return b;
        }
        return b;
    }

    public User signIn(String email, String password) {
        User logowanie= null;
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("SELECT * FROM user where (email=?) and (password=?)");
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,password);
            ResultSet result = preparedStatement.executeQuery();
            if(result.next()) {
                logowanie = new User();
                logowanie.getEmail(result.getString("email"));
                logowanie.getPassword(result.getString("password"));
            }
            preparedStatement.executeQuery();
            dbConnection.closeConnection();
        }
        catch (SQLException e) {
            dbConnection.closeConnection();
            e.printStackTrace();
        }
        return logowanie;
    }


}
