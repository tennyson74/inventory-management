package com.example.inventory.config;

import com.example.inventory.model.Product;
import com.example.inventory.repository.ProductRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataInitializationConfig {

    @Bean
    public CommandLineRunner initDatabase(ProductRepository productRepository) {
        return args -> {
            // Add some sample products
            productRepository.save(new Product("Laptop", 10, 999.99));
            productRepository.save(new Product("Smartphone", 20, 599.99));
            productRepository.save(new Product("Tablet", 15, 299.99));
            
            // Verify products are saved
            System.out.println("Sample products saved:");
            productRepository.findAll().forEach(product -> 
                System.out.println(product.getName() + " - Quantity: " + product.getQuantity())
            );
        };
    }
}