package com.example.Shop.Project;

import javax.swing.Spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

// @SpringBootApplication
// Exclude security auto-configuration to avoid conflicts with custom security configurations >< Include
@SpringBootApplication(exclude = 
org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)

public class ShopProjectApplication {

	public static void main(String[] args) {
		// print spring beans
		ApplicationContext abc = SpringApplication.run(ShopProjectApplication.class, args);
		for (String s : abc.getBeanDefinitionNames()) {
			System.out.println(s);
		}
	}

}
