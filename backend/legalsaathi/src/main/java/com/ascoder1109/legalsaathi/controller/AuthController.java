package com.ascoder1109.legalsaathi.controller;

import com.ascoder1109.legalsaathi.dto.UserLoginDTO;
import com.ascoder1109.legalsaathi.dto.UserRegistrationDTO;
import com.ascoder1109.legalsaathi.entity.User;
import com.ascoder1109.legalsaathi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public ResponseEntity<User> registerUser(
            @RequestBody UserRegistrationDTO registrationDto,
            @RequestHeader("API_KEY") String apiKey,
            @RequestHeader("API_NAME") String apiName) {
        if (!"2xfX15qTpVMlPpf2y19N3H7Idqu3r0GYvTKK88kRUbO4oLtDpqbplmQxrBsBYFiAtofzSk9KbuTxN99raUcAmtyn3KusCd7VoNvoQZ0es8ZoTt9yy5BnpFEkOjzFckNz".equals(apiKey) || !"LEGALSAATHI_AUTH_API".equals(apiName)) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        User registeredUser = userService.registerUser(registrationDto);
        return ResponseEntity.ok(registeredUser);
    }

    @PostMapping("/login")
    public ResponseEntity<User> loginUser(
            @RequestBody UserLoginDTO loginDto,
            @RequestHeader("API_KEY") String apiKey,
            @RequestHeader("API_NAME") String apiName) {
        if (!"2xfX15qTpVMlPpf2y19N3H7Idqu3r0GYvTKK88kRUbO4oLtDpqbplmQxrBsBYFiAtofzSk9KbuTxN99raUcAmtyn3KusCd7VoNvoQZ0es8ZoTt9yy5BnpFEkOjzFckNz".equals(apiKey) || !"LEGALSAATHI_AUTH_API".equals(apiName)) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        return userService.loginUser(loginDto)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.status(HttpStatus.UNAUTHORIZED).build());
    }
    @GetMapping("/user")
    public ResponseEntity<User> getUserByEmail(
            @RequestParam String email,
            @RequestHeader("API_KEY") String apiKey,
            @RequestHeader("API_NAME") String apiName) {
        if (!"your_api_key_here".equals(apiKey) || !"LEGALSAATHI_AUTH_API".equals(apiName)) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        User user = userService.findByEmail(email);
        if (user != null) {
            return ResponseEntity.ok(user);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }
}
