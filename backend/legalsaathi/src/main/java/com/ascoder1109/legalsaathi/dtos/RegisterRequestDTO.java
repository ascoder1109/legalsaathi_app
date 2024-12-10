package com.ascoder1109.legalsaathi.dtos;

import lombok.Data;

@Data
public class RegisterRequestDTO {
    private String name;
    private String email;
    private String phoneNumber;
    private String password;

}
