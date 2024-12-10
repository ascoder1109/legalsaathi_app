package com.ascoder1109.legalsaathi.services;

import com.ascoder1109.legalsaathi.dtos.LoginResponseDTO;
import com.ascoder1109.legalsaathi.entities.User;
import com.ascoder1109.legalsaathi.repositories.UserRepositories;
import com.ascoder1109.legalsaathi.security.CustomUserDetails;
import com.ascoder1109.legalsaathi.security.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private UserRepositories userRepositories;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JwtUtils jwtUtils;

    @Override
    public User registerUser(String name, String email, String phoneNumber, String password) {
        if (userRepositories.existsByEmail(email)){
            throw new IllegalArgumentException("User with this email already exists");
        }
        if (userRepositories.existsByPhoneNumber(phoneNumber)){
            throw new IllegalArgumentException("User with this phone number already exists");
        }
        String encodedPassword = passwordEncoder.encode(password);
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setPassword(encodedPassword);
//        user.setRole(role);
        return userRepositories.save(user);
    }

    @Override
    public LoginResponseDTO loginUser(String identifier, String password, boolean isEmail) {
        Optional<User> userOptional;

        if (isEmail) {
            userOptional = userRepositories.findByEmail(identifier);
        } else {
            userOptional = userRepositories.findByPhoneNumber(identifier);
        }

        if (userOptional.isEmpty()) {
            throw new IllegalArgumentException("User not found");
        }

        User user = userOptional.get();


        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new IllegalArgumentException("Incorrect password");
        }

        CustomUserDetails customUserDetails = new CustomUserDetails(user);


        String token = jwtUtils.generateToken(customUserDetails);

        return new LoginResponseDTO(token, "Login successful");
    }



}
