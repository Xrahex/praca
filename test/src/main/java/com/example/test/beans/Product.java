package com.example.test.beans;

public class Product {

    private String name;
    private int calorie;

    public int getDiet_list_id() {
        return diet_list_id;
    }

    public void setDiet_list_id(int diet_list_id) {
        this.diet_list_id = diet_list_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public Product(String name, int calorie, int diet_list_id, int product_id) {
        this.name = name;
        this.calorie = calorie;
        this.diet_list_id = diet_list_id;
        this.product_id = product_id;
    }

    private int diet_list_id;
    private int product_id;



    public Product() {
    }

    public Product(String name, Integer calorie) {
        this.name = name;
        this.calorie = calorie;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCalorie() {
        return calorie;
    }

    public void setCalorie(Integer calorie) {
        this.calorie = calorie;
    }
}
