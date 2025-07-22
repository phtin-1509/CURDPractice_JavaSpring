package com.example.Shop.Project.services;

import org.springframework.stereotype.Service;

import com.example.Shop.Project.domain.Role;
import com.example.Shop.Project.domain.User;
import com.example.Shop.Project.repository.RoleRepository;
import com.example.Shop.Project.repository.UserRepository;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    // Constructor-based dependency injection
    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    // Method to get user information (could be extended to fetch from the database)
    public List<User> getAllUserByEmails(String email) {
        // Logic to handle user saving
        return this.userRepository.findByEmail(email);
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public User createUser(User user) {
        // Logic to save the user to the database
        return this.userRepository.save(user);
    }

    public Optional<User> getUserById(Long id) {
        return this.userRepository.findById(id);
    }

    public void deleteUserById(Long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        // Logic to fetch role by name
        return this.roleRepository.findByName(name);
    }

}
