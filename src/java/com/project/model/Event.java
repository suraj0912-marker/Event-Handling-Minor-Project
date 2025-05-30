package com.project.model;

public class Event {
    private int id;
    private String name;
    private String description;
    private int price;

   
    public Event() {}

    public Event(int id, String name, String description, int price) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
    }

    public Event(String name, String description, int price) {
        this.name = name;
        this.description = description;
        this.price = price;
    }

 
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }
}
