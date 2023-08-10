package com.example.test.beans;

public class Product {

    private String name;
    private Integer calorie;

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
