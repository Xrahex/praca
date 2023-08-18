package com.example.test.beans;

public class DietList {

    private int diet_list_id;

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    private int id_user;
    private String name;

    public DietList() {
    }

    public DietList(int diet_list_id, int id_user, String name) {
        this.diet_list_id = diet_list_id;
        this.id_user = id_user;
        this.name = name;
    }

    public int getDiet_list_id() {
        return diet_list_id;
    }

    public void setDiet_list_id(int diet_list_id) {
        this.diet_list_id = diet_list_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
