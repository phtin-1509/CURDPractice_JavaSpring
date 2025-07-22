package com.example.Shop.Project.repository;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.Shop.Project.domain.User;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    // This interface can be used to define custom query methods if needed
    // For example, you can add methods to find users by email or other criteria

    // Example:
    // public Optional<User> findByEmail(String email) {
    // return findBy("email", email);
    // }

    User save(User user);

    void deleteById(Long id);

    List<User> findByEmail(String email);

    Optional<User> getUserById(Long id);

}
