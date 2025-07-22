package com.example.Shop.Project.repository;

import org.springframework.stereotype.Repository;

import com.example.Shop.Project.domain.Role;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
