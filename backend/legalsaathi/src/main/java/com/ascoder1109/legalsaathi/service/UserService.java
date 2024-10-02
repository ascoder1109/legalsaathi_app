package com.ascoder1109.legalsaathi.service;

import com.ascoder1109.legalsaathi.dto.UserLoginDTO;
import com.ascoder1109.legalsaathi.dto.UserRegistrationDTO;
import com.ascoder1109.legalsaathi.entity.User;
import com.ascoder1109.legalsaathi.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public User registerUser(UserRegistrationDTO registrationDto) {
        User user = new User();
        user.setName(registrationDto.getName());
        user.setEmail(registrationDto.getEmail());
        user.setPassword(passwordEncoder.encode(registrationDto.getPassword()));
        user.setPhoneNumber(registrationDto.getPhoneNumber());
        return userRepository.save(user);
    }

    public Optional<User> loginUser(UserLoginDTO loginDto) {
        return userRepository.findByEmail(loginDto.getEmail())
                .filter(user -> passwordEncoder.matches(loginDto.getPassword(), user.getPassword()));
    }
    public User findByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }
}