package com.example.Shop.Project.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long quantity;
    private double price;

    @ManyToOne
    @JoinColumn(name = "order_id") // Foreign key column in the order_details table
    // This establishes a many-to-one relationship with the Order entity
    private Order order; // Assuming you have an Order entity, this establishes a many-to-one relationship

    @ManyToOne
    @JoinColumn(name = "product_id") // Foreign key column in the order_details table
    private Product product; // Assuming you have a Product entity, this establishes a many-to-one relationship

    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public long getQuantity() {
        return quantity;
    }
    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetail [id=" + id + ", quantity=" + quantity + ", price=" + price + "]";
    }
    
    
}
