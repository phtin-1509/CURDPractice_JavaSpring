package com.example.Shop.Project.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.Shop.Project.domain.Product;
import com.example.Shop.Project.services.ProductService;

@Controller
public class ProductPageController {
    private final ProductService productService;

    public ProductPageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String showProductDetail(Model model, @PathVariable("id") Long productId) {
        // Logic to retrieve product details using productId
        Product product = productService.getProductById(productId).orElse(null);
        model.addAttribute("product", product);
        return "client/product/product-detail"; // JSP page for product detail
    }

}
