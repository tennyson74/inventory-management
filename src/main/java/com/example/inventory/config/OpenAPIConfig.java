package com.example.inventory.config;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.context.annotation.Configuration;

@Configuration
@OpenAPIDefinition(info = @Info(
    title = "Inventory Management API", 
    version = "1.0", 
    description = "API for managing product inventory"
))
public class OpenAPIConfig {
}