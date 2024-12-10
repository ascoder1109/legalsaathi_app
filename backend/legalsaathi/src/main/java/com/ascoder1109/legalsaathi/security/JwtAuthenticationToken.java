package com.ascoder1109.legalsaathi.security;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collections;

public class JwtAuthenticationToken extends AbstractAuthenticationToken {

    private final String email;
    private final String role;

    public JwtAuthenticationToken(String email, String role) {
        super(Collections.singletonList(new SimpleGrantedAuthority(role)));
        this.email = email;
        this.role = role;
        setAuthenticated(true);
    }

    @Override
    public Object getCredentials() {
        return null;
    }

    @Override
    public Object getPrincipal() {
        return email;
    }

    public String getRole() {
        return role;
    }
}
