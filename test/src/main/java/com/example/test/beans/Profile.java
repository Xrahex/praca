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
}
