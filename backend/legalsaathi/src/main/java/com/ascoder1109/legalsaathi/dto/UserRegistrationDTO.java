package com.ascoder1109.legalsaathi.dto;

import lombok.Data;

@Data
public class UserRegistrationDTO {
    private String name;
    private String email;
    private String password;
    private String phoneNumber;
}