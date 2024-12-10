package com.ascoder1109.legalsaathi.dtos;

import lombok.Data;

@Data
public class ChangeRoleToLawyerResponseDTO {
    private String message;
    private String userId;

    public ChangeRoleToLawyerResponseDTO(String message, String userId) {
        this.message = message;
        this.userId = userId;
    }
}
