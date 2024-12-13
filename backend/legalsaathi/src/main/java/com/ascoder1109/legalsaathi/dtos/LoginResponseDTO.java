package com.ascoder1109.legalsaathi.dtos;

import lombok.Data;

@Data
public class LoginResponseDTO {
    private String token;
    private String message;
    private String name;
    private String role;

    public LoginResponseDTO(String token, String message,  String name, String role) {
        this.token = token;
        this.message = message;
        this.name = name;
        this.role = role;
    }
}