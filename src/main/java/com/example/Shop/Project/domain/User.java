package com.example.Shop.Project.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

// @Entity is used to mark this class as a JPA entity (đánh dấu lớp này là một thực thể JPA)
// @Id is used to mark the primary key of the entity (đánh dấu khóa chính của thực thể)
@Entity
@Table(name = "users") // Specify the table name in the database (chỉ định tên bảng trong cơ sở dữ
                       // liệu)
public class User {
    @Id
    // Use @GeneratedValue to automatically generate the ID (tự động sinh ID)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String email;
    private String fullName;
    private String password;
    private String address;
    private String phone;
    private String avatar;

    @ManyToOne
    @JoinColumn(name = "role_id") // Foreign key column in the users table (cột khóa ngoại trong bảng người dùng)
    private Role role; // Assuming you have a Role entity, this establishes a many-to-one relationship

    @OneToMany(mappedBy = "user") // Assuming you have an Order entity, this establishes a one-to-many
                                  // relationship
    private List<Order> orders; // List of orders associated with the user

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", fullName='" + fullName + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", avatar='" + avatar + '\'' +
                '}';
    }
}
