package com.example.test.beans;

public class User {

    public User(String email, String password, String type, String nickname, int id) {
        this.email = email;
        this.password = password;
        this.type = type;
        this.nickname = nickname;
        this.id = id;
    }

    public User() {
    }

    public User(String email, String password, String nickname, int id) {
        this.email = email;
        this.password = password;
        this.nickname = nickname;
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    private String email;
    private String password;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    private String type;

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    private String nickname;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private int id;


    public void getEmail(String email) {
    }

    public void getPassword(String password) {
    }
}
