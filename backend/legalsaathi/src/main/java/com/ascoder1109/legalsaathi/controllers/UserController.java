package com.ascoder1109.legalsaathi.controllers;

import com.ascoder1109.legalsaathi.dtos.ApiResponse;
import com.ascoder1109.legalsaathi.dtos.ChangeRoleToLawyerRequestDTO;
import com.ascoder1109.legalsaathi.dtos.ChangeRoleToLawyerResponseDTO;
import com.ascoder1109.legalsaathi.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserService userService;

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
}
