package com.example.test.beans;

public class DietListwithnick {

    private int diet_list_id;
    private int id_user;
    private String name;
    private int calorie;
    private double bialko;
    private double weglowodany;
    private double tluszcz;
    private double kwasy_tluszczowe;
    private double blonnik;
    private double sol;
    private double cukry;
    private String nickname;

    public DietListwithnick(int diet_list_id, int id_user, String name, int calorie, double bialko, double weglowodany, double tluszcz, double kwasy_tluszczowe, double blonnik, double sol, double cukry, String nickname) {
        this.diet_list_id = diet_list_id;
        this.id_user = id_user;
        this.name = name;
        this.calorie = calorie;
        this.bialko = bialko;
        this.weglowodany = weglowodany;
        this.tluszcz = tluszcz;
        this.kwasy_tluszczowe = kwasy_tluszczowe;
        this.blonnik = blonnik;
        this.sol = sol;
        this.cukry = cukry;
        this.nickname = nickname;
    }

    public DietListwithnick() {
    }

    public int getDiet_list_id() {
        return diet_list_id;
    }

    public void setDiet_list_id(int diet_list_id) {
        this.diet_list_id = diet_list_id;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCalorie() {
        return calorie;
    }

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

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
}
