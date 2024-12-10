package com.ascoder1109.legalsaathi.services;

import com.ascoder1109.legalsaathi.dtos.LoginResponseDTO;
import com.ascoder1109.legalsaathi.entities.User;

public interface AuthService {
    User registerUser(String name, String email, String phoneNumber, String password);

    LoginResponseDTO loginUser(String identifier, String password, boolean isEmail);
}
