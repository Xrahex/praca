package com.example.test.beans;

public class Profile {

    public Profile(String plec) {
        this.plec = plec;
    }

    public Profile() {
    }

    public Profile(String plec, double CPM) {
        this.plec = plec;
        this.CPM = CPM;
    }

    public Profile(String plec, double CPM, String imie, String nazwisko) {
        this.plec = plec;
        this.CPM = CPM;
        this.imie = imie;
        this.nazwisko = nazwisko;
    }

    public String getPlec() {
        return plec;
    }

    public void setPlec(String plec) {
        this.plec = plec;
    }

    private String plec;

    public double getCPM() {
        return CPM;
    }

    public void setCPM(double CPM) {
        this.CPM = CPM;
    }

    private double CPM;

    public String getImie() {
        return imie;
    }

    public void setImie(String imie) {
        this.imie = imie;
    }

    public String getNazwisko() {
        return nazwisko;
    }

    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

    private String imie;
    private String nazwisko;
}
