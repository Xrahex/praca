package com.example.test.model;

import com.example.test.beans.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                user.setNickname(resultSet.getString("nickname"));
                user.setType(resultSet.getString("type"));
                allusers.add(user);
            }
            }
        catch (Exception e) {
            e.printStackTrace();
        }
        return allusers;
    }

    public boolean deleteuserbyid(int user_id) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("DELETE FROM user WHERE (id=?)");
            preparedStatement.setInt(1, user_id);
            preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            dbConnection.closeConnection();
        }
        return true;
    }

    public boolean updatenicknamebyid(int id, String nickname, String type) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("UPDATE user SET nickname=?, type=? WHERE (id=?)");
            preparedStatement.setString(1, nickname);
            preparedStatement.setString(2,type);
            preparedStatement.setInt(3, id);
            preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            dbConnection.closeConnection();
        }
        return true;
    }
}
