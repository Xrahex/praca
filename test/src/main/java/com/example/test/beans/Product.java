package com.example.test.beans;

public class Product {

    private String name;
    private int calorie;

    public Product(String name, int calorie, int poradnia, int diet_list_id, int product_id, double bialko, double weglowodany, double tluszcz, double kwasy_tluszczowe, double blonnik, double sol, double cukry) {
        this.name = name;
        this.calorie = calorie;
        this.poradnia = poradnia;
        this.diet_list_id = diet_list_id;
        this.product_id = product_id;
        this.bialko = bialko;
        this.weglowodany = weglowodany;
        this.tluszcz = tluszcz;
        this.kwasy_tluszczowe = kwasy_tluszczowe;
        this.blonnik = blonnik;
        this.sol = sol;
        this.cukry = cukry;
    }

    public Product(String name, int calorie, int poradnia, int diet_list_id, int product_id, double bialko, double weglowodany, double tluszcz, double kwasy_tluszczowe, double blonnik, double sol, double cukry, int czas_przygotownia, int laktoza, int gluten, int wegetarian, int wege) {
        this.name = name;
        this.calorie = calorie;
        this.poradnia = poradnia;
        this.diet_list_id = diet_list_id;
        this.product_id = product_id;
        this.bialko = bialko;
        this.weglowodany = weglowodany;
        this.tluszcz = tluszcz;
        this.kwasy_tluszczowe = kwasy_tluszczowe;
        this.blonnik = blonnik;
        this.sol = sol;
        this.cukry = cukry;
        this.czas_przygotownia = czas_przygotownia;
        this.laktoza = laktoza;
        this.gluten = gluten;
        this.wegetarian = wegetarian;
        this.wege = wege;
    }

    public int getPoradnia() {
        return poradnia;
    }

    public void setPoradnia(int poradnia) {
        this.poradnia = poradnia;
    }

    public Product(String name, int calorie, int poradnia, int diet_list_id, int product_id) {
        this.name = name;
        this.calorie = calorie;
        this.poradnia = poradnia;
        this.diet_list_id = diet_list_id;
        this.product_id = product_id;
    }

    private int poradnia;

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

    public void setCalorie(int calorie) {
        this.calorie = calorie;
    }

    public double getBialko() {
        return bialko;
    }

    public void setBialko(double bialko) {
        this.bialko = bialko;
    }

    public double getWeglowodany() {
        return weglowodany;
    }

    public void setWeglowodany(double weglowodany) {
        this.weglowodany = weglowodany;
    }

    public double getTluszcz() {
        return tluszcz;
    }

    public void setTluszcz(double tluszcz) {
        this.tluszcz = tluszcz;
    }

    public double getKwasy_tluszczowe() {
        return kwasy_tluszczowe;
    }

    public void setKwasy_tluszczowe(double kwasy_tluszczowe) {
        this.kwasy_tluszczowe = kwasy_tluszczowe;
    }

    public double getBlonnik() {
        return blonnik;
    }

    public void setBlonnik(double blonnik) {
        this.blonnik = blonnik;
    }

    public double getSol() {
        return sol;
    }

    public void setSol(double sol) {
        this.sol = sol;
    }

    public double getCukry() {
        return cukry;
    }

    public void setCukry(double cukry) {
        this.cukry = cukry;
    }

    private double bialko;
    private double weglowodany;
    private double tluszcz;
    private double kwasy_tluszczowe;
    private double blonnik;
    private double sol;
    private double cukry;

    public int getCzas_przygotownia() {
        return czas_przygotownia;
    }

    public void setCzas_przygotownia(int czas_przygotownia) {
        this.czas_przygotownia = czas_przygotownia;
    }

    public int getLaktoza() {
        return laktoza;
    }

    public void setLaktoza(int laktoza) {
        this.laktoza = laktoza;
    }

    public int getGluten() {
        return gluten;
    }

    public void setGluten(int gluten) {
        this.gluten = gluten;
    }

    public int getWegetarian() {
        return wegetarian;
    }

    public void setWegetarian(int wegetarian) {
        this.wegetarian = wegetarian;
    }

    public int getWege() {
        return wege;
    }

    public void setWege(int wege) {
        this.wege = wege;
    }

    private int czas_przygotownia;
    private int laktoza;
    private int gluten;
    private int wegetarian;
    private int wege;

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
