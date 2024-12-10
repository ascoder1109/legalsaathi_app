package com.ascoder1109.legalsaathi.services;

import com.ascoder1109.legalsaathi.dtos.ChangeRoleToLawyerRequestDTO;
import com.ascoder1109.legalsaathi.dtos.ChangeRoleToLawyerResponseDTO;
import com.ascoder1109.legalsaathi.entities.Lawyer;
import com.ascoder1109.legalsaathi.entities.Role;
import com.ascoder1109.legalsaathi.entities.User;
import com.ascoder1109.legalsaathi.repositories.LawyerRepositories;
import com.ascoder1109.legalsaathi.repositories.UserRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepositories userRepositories;

    @Autowired
    private LawyerRepositories lawyerRepository;

    public ChangeRoleToLawyerResponseDTO changeRoleToLawyer(ChangeRoleToLawyerRequestDTO lawyerDetailsDTO) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();

        User user = userRepositories.findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("User not found"));

        if (lawyerRepository.existsByUserId(user.getId())) {
            throw new IllegalArgumentException("User already has a Lawyer profile.");
        }


        user.setRole(Role.LAWYER);
        userRepositories.save(user);


        Lawyer lawyer = new Lawyer();
        lawyer.setUser(user);
        lawyer.setLawyerSpecialization(lawyerDetailsDTO.getLawyerSpecialization());
        lawyer.setBarCouncilId(lawyerDetailsDTO.getBarCouncilId());
        lawyer.setExperience(lawyerDetailsDTO.getExperience());
        lawyer.setFirmName(lawyerDetailsDTO.getFirmName());
        lawyer.setOfficeAddress(lawyerDetailsDTO.getOfficeAddress());

        lawyerRepository.save(lawyer);


        return new ChangeRoleToLawyerResponseDTO("User role changed to Lawyer and profile created successfully", user.getId().toString());
    }
}
