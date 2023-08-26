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
            preparedStatement.setInt(1, dietList.getId_user());
            preparedStatement.setString(2, dietList.getName());
            preparedStatement.executeQuery();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        dbConnection.closeConnection();
        return true;
    }

    public List<DietList> alldiets(int id_user) {
        List<DietList> wszystkiediety = new ArrayList<>();
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("SELECT * FROM diets where id_user=?");
            preparedStatement.setInt(1,id_user);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                DietList dietList = new DietList();
                dietList.setDiet_list_id(resultSet.getInt("id_diet"));
                dietList.setId_user(resultSet.getInt("id_user"));
                dietList.setName(resultSet.getString("diet_name"));
                wszystkiediety.add(dietList);
            }
        } catch (SQLException e) {
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
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            dbConnection.closeConnection();
        }
        return true;
    }

    public boolean updateDietlistbyid(int id_diet, String diet_name) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("UPDATE diets SET diet_name=? WHERE (id_diet=?)");
            preparedStatement.setString(1, diet_name);
            preparedStatement.setInt(2, id_diet);
            preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            dbConnection.closeConnection();
        }
        return true;
    }

    public DietList searchDietListByListid(int list_id) {
        DietList dietList = new DietList();

        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("SELECT * FROM diets INNER JOIN user ON diets.id_user = user.id where (id_diet=?)");
            preparedStatement.setInt(1, list_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                dietList.setDiet_list_id(resultSet.getInt("id_diet"));
                dietList.setId_user(resultSet.getInt("id_user"));
                dietList.setName(resultSet.getString("diet_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnection.closeConnection();
        }
        return dietList;
    }

    public List<Product> getproductsfromdiet(int list_id) {

        List<Product> produkty = new ArrayList<>();
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("SELECT * FROM products WHERE diet_list_id=?");
            preparedStatement.setInt(1, list_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Product product= new Product();
                product.setProduct_id(resultSet.getInt("product_id"));
                product.setDiet_list_id(resultSet.getInt("diet_list_id"));
                product.setName(resultSet.getString("product_name"));
                product.setCalorie(resultSet.getInt("calorie"));
                produkty.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    return  produkty;
    }

    public boolean createdietproductsniadanie(Product product) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("INSERT into products(diet_list_id,product_name,calorie,pora_dnia) values (?,?,?,?)");
            preparedStatement.setInt(1,product.getDiet_list_id());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setInt(3, product.getCalorie());
            preparedStatement.setInt(4,product.getPoradnia());
            preparedStatement.executeQuery();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        dbConnection.closeConnection();
        return true;
    }

    public boolean deleteproductbyid(int product_id) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("DELETE FROM products WHERE (product_id=?)");
            preparedStatement.setInt(1, product_id);
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