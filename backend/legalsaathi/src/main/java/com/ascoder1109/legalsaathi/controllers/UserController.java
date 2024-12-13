package com.ascoder1109.legalsaathi.controllers;

import com.ascoder1109.legalsaathi.dtos.ApiResponse;
import com.ascoder1109.legalsaathi.dtos.ChangeRoleToLawyerRequestDTO;
import com.ascoder1109.legalsaathi.dtos.ChangeRoleToLawyerResponseDTO;
import com.ascoder1109.legalsaathi.dtos.UserDetailsDTO;
import com.ascoder1109.legalsaathi.entities.Lawyer;
import com.ascoder1109.legalsaathi.entities.Role;
import com.ascoder1109.legalsaathi.entities.User;
import com.ascoder1109.legalsaathi.services.LawyerService;
import com.ascoder1109.legalsaathi.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private LawyerService lawyerService;

    @PostMapping("/change-role-to-lawyer")
    public ResponseEntity<ApiResponse<ChangeRoleToLawyerResponseDTO>> changeRoleToLawyer(
            @RequestBody ChangeRoleToLawyerRequestDTO lawyerDetailsDTO) {

        try {

            ChangeRoleToLawyerResponseDTO responseDTO = userService.changeRoleToLawyer(lawyerDetailsDTO);

            ApiResponse<ChangeRoleToLawyerResponseDTO> response = new ApiResponse<>(
                    "success", responseDTO, "User role changed to Lawyer successfully");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {

            ApiResponse<ChangeRoleToLawyerResponseDTO> response = new ApiResponse<>(
                    "error", null, e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }
    }


    @GetMapping("/profile")
    public ResponseEntity<ApiResponse<UserDetailsDTO>> getUserDetails() {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String email = authentication.getName();  // Get the email of the logged-in user

            User user = userService.getUserByEmail(email);

            if (user == null) {
                return new ResponseEntity<>(new ApiResponse<>("error", null, "User not found"), HttpStatus.NOT_FOUND);
            }

            UserDetailsDTO userDetailsDTO = new UserDetailsDTO(user);

            Lawyer lawyer = null;
            if (user.getRole() == Role.LAWYER) {
                lawyer = lawyerService.getLawyerByUserId(user.getId());
            }

            if (lawyer != null) {
                userDetailsDTO.setLawyerDetails(lawyer);
            }

            ApiResponse<UserDetailsDTO> response = new ApiResponse<>("success", userDetailsDTO, "User profile fetched successfully");
            return new ResponseEntity<>(response, HttpStatus.OK);

        } catch (Exception e) {
            ApiResponse<UserDetailsDTO> response = new ApiResponse<>("error", null, e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }
    }
}
