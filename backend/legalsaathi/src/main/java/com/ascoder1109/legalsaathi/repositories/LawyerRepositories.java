package com.ascoder1109.legalsaathi.repositories;

import com.ascoder1109.legalsaathi.entities.Lawyer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface LawyerRepositories extends JpaRepository<Lawyer, Long> {
    Optional<Lawyer> findById(Long id);
    boolean existsByUserId(Long userId);
}
