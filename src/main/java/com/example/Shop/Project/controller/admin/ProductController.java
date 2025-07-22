package com.example.Shop.Project.controller.admin;

import java.util.List;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.Shop.Project.domain.Product;
import com.example.Shop.Project.services.ProductService;
import com.example.Shop.Project.services.UploadService;

import jakarta.validation.Valid;

@Controller
public class ProductController {
    // This controller will handle product-related requests
    // You can add methods to handle product creation, updates, deletion, etc.

    // Example method to show a product list page
    // @GetMapping("/admin/products")
    // public String showProductList() {
    // return "admin/product/product-list"; // JSP page for product list
    // }
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String showProduct(Model model) {
        List<Product> prs = this.productService.getAllProducts();
        model.addAttribute("products", prs);
        return "admin/product/product-home"; // JSP page for product detail
    }

    // add new product
    @GetMapping("/admin/product/create")
    public String showCreateProductForm(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/product-create"; // JSP page for creating a new product
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@ModelAttribute("newProduct") @Valid Product product, BindingResult bindingResult,
            @RequestParam("tinFile") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            // If there are validation errors, return to the form
            return "admin/product/product-create";
        }

        String image = this.uploadService.handleFileUpload(file, "product");
        product.setImageUrl(image);
        this.productService.createProduct(product);
        // Logic to save the product would go here
        // For now, we just return the product detail page
        return "redirect:/admin/product"; // Redirect to product detail page after creation
    }

    // view product detail
    @GetMapping("/admin/product/{id}")
    public String viewProductDetail(Model model, @PathVariable Long id) {
        Product product = this.productService.getProductById(id).orElse(null);
        model.addAttribute("product", product);
        return "admin/product/product-detail";
    }

    // delete product
    @GetMapping("/admin/product/delete/{id}")
    public String deleteProduct(Model model, @PathVariable Long id) {
        model.addAttribute("id", id);
        Product product = new Product();
        product.setId(id);
        model.addAttribute("newProduct", product);
        return "admin/product/product-delete";
    }

    @PostMapping("/admin/product/delete")
    public String deleteProduct(@ModelAttribute("newProduct") Product product) {
        this.productService.deleteProductById(product.getId());
        return "redirect:/admin/product";
    }

    // update product
    @GetMapping("/admin/product/update/{id}")
    public String updateProduct(Model model, @PathVariable("id") Long id) {
        Product product = this.productService.getProductById(id).orElse(null);
        if (product == null) {
            return "redirect:/admin/product";
        }
        model.addAttribute("product", product);
        return "admin/product/product-update";
    }

    @PostMapping("/admin/product/update/{id}")
    public String updateProduct(Model model, @PathVariable("id") Long id, @ModelAttribute("product") Product product,
            @RequestParam("updateImage") MultipartFile file) {
        Product existingProduct = this.productService.getProductById(id).orElse(null);
        if (existingProduct != null) {
            existingProduct.setName(product.getName());
            existingProduct.setPrice(product.getPrice());
            existingProduct.setQuantity(product.getQuantity());
            existingProduct.setFactory(product.getFactory());
            existingProduct.setDetailDesc(product.getDetailDesc());
            existingProduct.setShortDesc(product.getShortDesc());
            if (file != null && !file.isEmpty()) {
                String productImage = this.uploadService.handleFileUpload(file, "product");
                existingProduct.setImageUrl(productImage);
            }
            this.productService.updateProduct(existingProduct);
        }
        return "redirect:/admin/product";
    }

}
