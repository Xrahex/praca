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
            PreparedStatement preparedStatement1= connect.prepareStatement("SELECT id from user where email=?");
            preparedStatement1.setString(1,user.getEmail());
            ResultSet result = preparedStatement1.executeQuery();
            int userid;
            if(result.next()) {
                userid = result.getInt("id");
                preparedStatement1.close();
                PreparedStatement preparedStatement2 = connect.prepareStatement("INSERT into profile (user_id,login,imie,nazwisko) values(?,?,?,?)");
                preparedStatement2.setInt(1,userid);
                preparedStatement2.setString(2,"");
                preparedStatement2.setString(3,"");
                preparedStatement2.setString(4,"");
                preparedStatement2.executeUpdate();
                preparedStatement2.close();
            }
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

    public void change_password(User user, String password, String password2) throws  SQLException{
        connect = dbConnection.openConnection();
        PreparedStatement preparedStatement = connect.prepareStatement("UPDATE user set password=? where password=? and email=?");
        preparedStatement.setString(1,password2);
        preparedStatement.setString(2,password);
        preparedStatement.setString(3,user.getEmail());
        preparedStatement.executeQuery();
    }

    public void change_personals(User user,String login, String imie, String nazwisko) throws SQLException {
        connect = dbConnection.openConnection();
        PreparedStatement preparedStatement = connect.prepareStatement("UPDATE profile set login =?,imie=?, nazwisko=? where user_id=?");
        preparedStatement.setString(1,login);
        preparedStatement.setString(2,imie);
        preparedStatement.setString(3,nazwisko);
        preparedStatement.setString(4,user.getId());
        preparedStatement.executeQuery();
    }


}
