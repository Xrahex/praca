package com.example.test.model;

import com.example.test.beans.DietList;
import com.example.test.beans.Profile;
import com.example.test.beans.User;
import com.example.test.tools.password_sha;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDbModel {

    Connection connect;
    Databaseconnect dbConnection = new Databaseconnect();
    boolean b;


    public boolean signUp(User user) {
        boolean b = false;
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("INSERT into user(email,password,nickname,type) values (?,?,?,?)");
            preparedStatement.setString(1,user.getEmail());
            preparedStatement.setString(2,password_sha.encrypt(user.getPassword()));
            preparedStatement.setString(3,user.getNickname());
            preparedStatement.setString(4,"user");
            preparedStatement.executeUpdate();
            preparedStatement.close();
            PreparedStatement preparedStatement1= connect.prepareStatement("SELECT id from user where email=?");
            preparedStatement1.setString(1,user.getEmail());
            ResultSet result = preparedStatement1.executeQuery();
            int userid;
            if(result.next()) {
                userid = result.getInt("id");
                preparedStatement1.close();
                PreparedStatement preparedStatement2 = connect.prepareStatement("INSERT into profile (user_id,imie,nazwisko,CPM,waga,wzrost,plec,liczba_posilkow,czas_posilkow,preferencje) values(?,?,?,?,?,?,?,?,?,?)");
                preparedStatement2.setInt(1,userid);
                preparedStatement2.setString(2,"");
                preparedStatement2.setString(3,"");
                preparedStatement2.setInt(4,0);
                preparedStatement2.setInt(5,0);
                preparedStatement2.setInt(6,0);
                preparedStatement2.setString(7,"");
                preparedStatement2.setInt(8,0);
                preparedStatement2.setInt(9,0);
                preparedStatement2.setInt(10,0);
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
        User logowanie = null;
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("SELECT * FROM user where (email=?) and (password=?)");
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,password_sha.encrypt(password));
            ResultSet result = preparedStatement.executeQuery();
            if(result.next()) {
                logowanie = new User();
                logowanie.setId(result.getInt("id"));
                logowanie.setEmail(result.getString("email"));
                logowanie.setPassword(result.getString("password"));
                logowanie.setNickname(result.getString("nickname"));
                logowanie.setType(result.getString("type"));
            }
            dbConnection.closeConnection();
            return logowanie;
        }
        catch (SQLException e) {
            e.printStackTrace();
            dbConnection.closeConnection();
        }
        return logowanie;
    }

    public void change_password(User user, String password, String password2) throws  SQLException{
        connect = dbConnection.openConnection();
        PreparedStatement preparedStatement = connect.prepareStatement("UPDATE user set password=? where password=? and email=?");
        preparedStatement.setString(1,password_sha.encrypt(password2));
        preparedStatement.setString(2,password_sha.encrypt(password));
        preparedStatement.setString(3,user.getEmail());
        preparedStatement.executeQuery();
        System.out.println("test");
    }

    public void change_personals(User user, String imie, String nazwisko, double waga , int wzrost, int wiek, String plec, int liczba_posilkow, int czas_posilkow, int preferencje) throws SQLException {
        connect = dbConnection.openConnection();
        PreparedStatement preparedStatement = connect.prepareStatement("UPDATE profile set imie=?, nazwisko=?, waga=?, wzrost=?, wiek=?, plec=?, liczba_posilkow=?, czas_posilkow=?, preferencje=? where user_id=?");
        preparedStatement.setString(1,imie);
        preparedStatement.setString(2,nazwisko);
        preparedStatement.setDouble(3,waga);
        preparedStatement.setInt(4,wzrost);
        preparedStatement.setInt(5,wiek);
        preparedStatement.setString(6,plec);
        preparedStatement.setInt(7,liczba_posilkow);
        preparedStatement.setInt(8,czas_posilkow);
        preparedStatement.setInt(9,preferencje);
        preparedStatement.setInt(10,user.getId());
        System.out.println(user.getId());
        preparedStatement.executeQuery();
    }

    public Profile select_profile(User user){
        Profile profile = null;
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("SELECT * FROM profile where user_id=?");
            preparedStatement.setInt(1,user.getId());
            ResultSet result = preparedStatement.executeQuery();
            if(result.next()) {
                profile= new Profile();
                profile.setPlec(result.getString("plec"));
                profile.setCPM(result.getDouble("CPM"));
                profile.setImie(result.getString("imie"));
                profile.setNazwisko(result.getString("nazwisko"));
            }
            dbConnection.closeConnection();
            return profile;
        }
        catch (SQLException e) {
            e.printStackTrace();
            dbConnection.closeConnection();
        }
        return profile;
    }

    public boolean updateuserCPM(int user_id, double CPM) throws SQLException{
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("UPDATE profile SET CPM=? WHERE (user_id=?)");
            preparedStatement.setDouble(1, CPM);
            preparedStatement.setInt(2, user_id);
            preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            dbConnection.closeConnection();
        }
        return true;
    }

    public List<DietList> finddiets(double CPM1, double CPM2, int czas_przygotwania, String name) throws SQLException{
        List<DietList> diets = new ArrayList<>();
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement;
            if(name!=null) {
                preparedStatement = connect.prepareStatement("Select * from diets where calories BETWEEN ? AND ? AND czas_przygotowania =? AND " + name + "<>1  order by calories DESC LIMIT 3;");
            }
            else {
                 preparedStatement = connect.prepareStatement("Select * from diets where calories BETWEEN ? AND ? AND czas_przygotowania =? order by calories DESC LIMIT 3;");
            }
            preparedStatement.setDouble(1, CPM1);
            preparedStatement.setDouble(2, CPM2);
            preparedStatement.setInt(3,czas_przygotwania);
            preparedStatement.setString(4,name);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                DietList dietList= new DietList();
                dietList.setDiet_list_id(resultSet.getInt("id_diet"));
                dietList.setId_user(resultSet.getInt("id_user"));
                dietList.setName(resultSet.getString("diet_name"));
                diets.add(dietList);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnection.closeConnection();
        }
        return diets;
    }

    public void asigndiet(User user, int dietlistid) throws SQLException {
        try {
            connect = dbConnection.openConnection();
            PreparedStatement preparedStatement = connect.prepareStatement("INSERT into assign(user_id,dietlist_id) values (?,?);");
            preparedStatement.setInt(1, user.getId());
            preparedStatement.setInt(2, dietlistid);
            System.out.println(user.getId());
            preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
             dbConnection.closeConnection();
        }
    }

}
