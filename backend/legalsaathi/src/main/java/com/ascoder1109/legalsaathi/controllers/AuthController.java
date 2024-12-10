package com.ascoder1109.legalsaathi.controllers;

import com.ascoder1109.legalsaathi.dtos.ApiResponse;
import com.ascoder1109.legalsaathi.dtos.LoginRequestDTO;
import com.ascoder1109.legalsaathi.dtos.LoginResponseDTO;
import com.ascoder1109.legalsaathi.dtos.RegisterRequestDTO;
import com.ascoder1109.legalsaathi.services.AuthServiceImpl;
import com.ascoder1109.legalsaathi.config.ApiConfig; // Import ApiConfig
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class AuthController {

    @Autowired
    private AuthServiceImpl authService;

    @Autowired
    private ApiConfig apiConfig;

    @PostMapping("/auth/register")
    public ResponseEntity<ApiResponse<String>> registerUser(@RequestBody RegisterRequestDTO registerRequestDTO) {
        try {

            String apiName = apiConfig.getAuthApiName();
            String apiKey = apiConfig.getAuthApiKey();

            // You can log or use the apiName and apiKey as needed for your business logic.
//            System.out.println("API Name: " + apiName);
//            System.out.println("API Key: " + apiKey);

            authService.registerUser(registerRequestDTO.getName(), registerRequestDTO.getEmail(),
                    registerRequestDTO.getPhoneNumber(), registerRequestDTO.getPassword());
            ApiResponse<String> response = new ApiResponse<>("success", null, "User registered successfully");
            return new ResponseEntity<>(response, HttpStatus.CREATED);
        } catch (Exception e) {
            ApiResponse<String> response = new ApiResponse<>("error", null, e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/auth/login")
    public ResponseEntity<ApiResponse<LoginResponseDTO>> loginUser(@RequestBody LoginRequestDTO loginRequestDTO) {
        try {
            boolean isEmail = loginRequestDTO.getEmail() != null && !loginRequestDTO.getEmail().isEmpty();


            String apiName = apiConfig.getAuthApiName();
            String apiKey = apiConfig.getAuthApiKey();

//            System.out.println("API Name: " + apiName);
//            System.out.println("API Key: " + apiKey);

            LoginResponseDTO loginResponse = authService.loginUser(
                    loginRequestDTO.getEmail() != null ? loginRequestDTO.getEmail() : loginRequestDTO.getPhoneNumber(),
                    loginRequestDTO.getPassword(), isEmail);

            ApiResponse<LoginResponseDTO> response = new ApiResponse<>("success", loginResponse, "Login successful");
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            ApiResponse<LoginResponseDTO> response = new ApiResponse<>("error", null, e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.UNAUTHORIZED);
        }
    }
}
