package com.example.test.model;

import com.example.test.beans.DietList;
import com.example.test.beans.Product;

import java.math.BigDecimal;
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
            PreparedStatement preparedStatement = connect.prepareStatement("INSERT into products(product_name,calorie,bialko) values (?,?,?)");
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getCalorie());
            preparedStatement.setDouble(3,product.getBialko());
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

    public boolean updateDietcaloriebyid(int id_diet, int calories) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("UPDATE diets SET calories=? WHERE (id_diet=?)");
            preparedStatement.setInt(1, calories);
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
                product.setPoradnia(resultSet.getInt("pora_dnia"));
                produkty.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    return  produkty;
    }

    public List<Product> getproductsfromdiet1(int list_id, int pora_dnia) {

        List<Product> produkty = new ArrayList<>();
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("SELECT * FROM products WHERE diet_list_id=? and pora_dnia=?");
            preparedStatement.setInt(1, list_id);
            preparedStatement.setInt(2, pora_dnia);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Product product= new Product();
                product.setProduct_id(resultSet.getInt("product_id"));
                product.setDiet_list_id(resultSet.getInt("diet_list_id"));
                product.setName(resultSet.getString("product_name"));
                product.setCalorie(resultSet.getInt("calorie"));
                product.setPoradnia(resultSet.getInt("pora_dnia"));
                product.setBialko(resultSet.getDouble("bialko"));
                product.setWeglowodany(resultSet.getDouble("weglowodany"));
                product.setTluszcz(resultSet.getDouble("tluszcz"));
                product.setKwasy_tluszczowe(resultSet.getDouble("kwasy_tluszczowe"));
                product.setBlonnik(resultSet.getDouble("blonnik"));
                product.setSol(resultSet.getDouble("sol"));
                product.setCukry(resultSet.getDouble("cukry"));
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
            PreparedStatement preparedStatement = connect.prepareStatement("INSERT into products(diet_list_id,product_name,calorie,pora_dnia,bialko,weglowodany,tluszcz,kwasy_tluszczowe,blonnik,sol,cukry) values (?,?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setInt(1,product.getDiet_list_id());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setInt(3, product.getCalorie());
            preparedStatement.setInt(4,product.getPoradnia());
            preparedStatement.setDouble(5,product.getBialko());
            preparedStatement.setDouble(6,product.getWeglowodany());
            preparedStatement.setDouble(7,product.getTluszcz());
            preparedStatement.setDouble(8,product.getKwasy_tluszczowe());
            preparedStatement.setDouble(9,product.getBlonnik());
            preparedStatement.setDouble(10,product.getSol());
            preparedStatement.setDouble(11,product.getCukry());
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

    public boolean updateproductbyid(int product_id,String product_name, int calorie, BigDecimal bialko, BigDecimal weglowodany, BigDecimal tluszcz, BigDecimal kwasy_tluszczowe, BigDecimal blonnik, BigDecimal sol, BigDecimal cukry) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("UPDATE products SET product_name=?, calorie=? , bialko=?, weglowodany=?, tluszcz=?, kwasy_tluszczowe=?, blonnik=?, sol=?, cukry=? WHERE (product_id=?)");
            preparedStatement.setString(1, product_name);
            preparedStatement.setInt(2, calorie);
            preparedStatement.setBigDecimal(3,bialko);
            preparedStatement.setBigDecimal(4,weglowodany);
            preparedStatement.setBigDecimal(5,tluszcz);
            preparedStatement.setBigDecimal(6,kwasy_tluszczowe);
            preparedStatement.setBigDecimal(7,blonnik);
            preparedStatement.setBigDecimal(8,sol);
            preparedStatement.setBigDecimal(9,cukry);
            preparedStatement.setInt(10, product_id);
            preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            dbConnection.closeConnection();
        }
        return true;
    }

    public int caloriecount(int diet_list_id) {
        int suma= 0;
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement(
                    "SELECT calorie from products where diet_list_id=?");
            preparedStatement.setInt(1,diet_list_id);
            ResultSet resultSet;
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                BigDecimal s =resultSet.getBigDecimal("calorie");
                suma=suma+s.intValue();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally {
            dbConnection.closeConnection();
        }
        return suma;
    }

    public BigDecimal count(int diet_list_id, String name) {
        BigDecimal d= new BigDecimal(0);
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement(
                    "SELECT SUM("+name+") from products where diet_list_id=?");
            preparedStatement.setInt(1,diet_list_id);
            ResultSet resultSet;
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                d = resultSet.getBigDecimal(1);
                System.out.println(d);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally {
            dbConnection.closeConnection();
        }
        return d;
    }

    public boolean updateDietelementbyid(int id_diet, BigDecimal wartosc, String name) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("UPDATE diets SET "+name+"="+wartosc+" WHERE (id_diet=?)");
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



    public List<DietList> saved_diets(int id_user) {
        List<DietList> zapisanediety = new ArrayList<>();
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("SELECT * FROM diets INNER JOIN assign ON diets.id_diet = assign.dietlist_id WHERE user_id=?;");
            preparedStatement.setInt(1,id_user);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                DietList dietList = new DietList();
                dietList.setDiet_list_id(resultSet.getInt("id_diet"));
                dietList.setId_user(resultSet.getInt("id_user"));
                dietList.setName(resultSet.getString("diet_name"));
                zapisanediety.add(dietList);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return zapisanediety;
    }

    public boolean deletesavedDiettbyid(int id_diet, int id_user) {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("DELETE FROM assign WHERE (user_id=?) and (dietlist_id=?)");
            preparedStatement.setInt(1, id_user);
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

}