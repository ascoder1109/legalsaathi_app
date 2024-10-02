package com.ascoder1109.legalsaathi.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "legalsaathi_user_table")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name="designation")
    private String designation = "individual";  // Set default value here


    public User() {
        this.designation = "individual";
    }

}