package com.example.test.beans;

public class Profile {

    public Profile(String plec) {
        this.plec = plec;
    }

    public Profile() {
    }

    public String getPlec() {
        return plec;
    }

    public void setPlec(String plec) {
        this.plec = plec;
    }

    private String plec;
}
