package com.ascoder1109.legalsaathi.services;

import com.ascoder1109.legalsaathi.entities.Lawyer;
import com.ascoder1109.legalsaathi.repositories.LawyerRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LawyerService {

    @Autowired
    private LawyerRepositories lawyerRepositories;


    public Lawyer createOrUpdateLawyerProfile(Lawyer lawyer) {
        return lawyerRepositories.save(lawyer);
    }


    public Lawyer getLawyerByUserId(Long userId) {
        return lawyerRepositories.findById(userId).orElse(null); // Return null if not found
    }


    public boolean isLawyerProfileExist(Long userId) {
        return lawyerRepositories.existsByUserId(userId);
    }
}
