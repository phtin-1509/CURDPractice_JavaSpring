package com.example.Shop.Project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.Shop.Project.domain.Product;
import com.example.Shop.Project.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product createProduct(Product product) {
        // Logic to create a new product
        return this.productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        // Logic to retrieve all products
        return this.productRepository.findAll();
    }

    public Optional<Product> getProductById(Long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(Long id) {
        this.productRepository.deleteById(id);
    }

    public Product updateProduct(Product product) {
        return this.productRepository.save(product);
    }

}
