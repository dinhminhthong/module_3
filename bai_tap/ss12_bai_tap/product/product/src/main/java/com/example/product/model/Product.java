package com.example.product.model;

public class Product {
    private int Id;
    private String name;
    private String price;

    public Product() {
    }

    public Product(int id, String name, String price) {
        Id = id;
        this.name = name;
        this.price = price;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
