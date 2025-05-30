package com.project.model;

public class User {
    private String name;
    private String email;
    private String password;
    private String branch;
    private String year;
    private String semester;
    private String mobile;
    private String role;       
    private String question;
    private String answer;

    public User() {}

    public User(String name, String email, String password, String branch, String year, String semester,
                String mobile, String role, String question, String answer) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.branch = branch;
        this.year = year;
        this.semester = semester;
        this.mobile = mobile;
        this.role = role;
        this.question = question;
        this.answer = answer;
    }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getBranch() { return branch; }
    public void setBranch(String branch) { this.branch = branch; }

    public String getYear() { return year; }
    public void setYear(String year) { this.year = year; }

    public String getSemester() { return semester; }
    public void setSemester(String semester) { this.semester = semester; }

    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }

    public String getAnswer() { return answer; }
    public void setAnswer(String answer) { this.answer = answer; }
}
