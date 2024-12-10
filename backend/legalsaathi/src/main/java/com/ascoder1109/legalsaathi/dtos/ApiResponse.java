package com.ascoder1109.legalsaathi.dtos;


import lombok.Data;

@Data
public class ApiResponse<T> {
    private String status;
    private T data;
    private String message;

    public ApiResponse(String status, T data, String message) {
        this.status = status;
        this.data = data;
        this.message = message;
    }
}
