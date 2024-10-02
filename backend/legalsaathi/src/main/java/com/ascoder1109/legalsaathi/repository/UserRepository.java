package com.ascoder1109.legalsaathi.repository;

import com.ascoder1109.legalsaathi.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User,Long> {
    Optional<User> findByEmail(String email);
}