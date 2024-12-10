package com.ascoder1109.legalsaathi.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApiConfig {

    @Value("${auth.api.name}")
    private String authApiName;

    @Value("${auth.api.key}")
    private String authApiKey;

    public String getAuthApiName() {
        return authApiName;
    }

    public String getAuthApiKey() {
        return authApiKey;
    }
}
