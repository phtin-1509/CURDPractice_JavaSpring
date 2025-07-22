package com.example.Shop.Project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.Shop.Project.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // This interface will handle CRUD operations for Product entities
    // You can add custom query methods if needed
    List<Product> findAll();
}
