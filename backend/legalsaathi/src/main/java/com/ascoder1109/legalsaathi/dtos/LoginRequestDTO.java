package com.ascoder1109.legalsaathi.dtos;

import lombok.Data;

@Data
public class LoginRequestDTO {
    private String email;
    private String phoneNumber;
    private String password;
}
