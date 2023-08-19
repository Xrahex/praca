package com.example.test.model;

import com.example.test.beans.DietList;
import com.example.test.beans.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public boolean createdietlist(DietList dietList) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("INSERT into diets(id_user,diet_name) values (?,?)");
            preparedStatement.setInt(1,dietList.getId_user());
            preparedStatement.setString(2,dietList.getName());
            preparedStatement.executeQuery();
            preparedStatement.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        dbConnection.closeConnection();
        return true;
    }

    public List<DietList> alldiets() {
        List<DietList> wszystkiediety= new ArrayList<>();
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("SELECT * FROM diets");
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                DietList dietList=new DietList();
                dietList.setDiet_list_id(resultSet.getInt("id_diet"));
                dietList.setId_user(resultSet.getInt("id_user"));
                dietList.setName(resultSet.getString("diet_name"));
                wszystkiediety.add(dietList);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return wszystkiediety;
    }

    public boolean deleteDietlistbyid(int id_diet) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("DELETE FROM diets WHERE (id_diet=?)");
            preparedStatement.setInt(1, id_diet);
            preparedStatement.executeQuery();
        }
        catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            dbConnection.closeConnection();
        }
        return true;
    }


}