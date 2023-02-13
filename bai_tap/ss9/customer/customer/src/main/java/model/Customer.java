package model;

public class Customer {
    private String name;
    private String date;
    private String address;
    private String photo;

    public Customer() {
    }

    public Customer(String name, String date, String address, String photo) {
        this.name = name;
        this.date = date;
        this.address = address;
        this.photo = photo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}
