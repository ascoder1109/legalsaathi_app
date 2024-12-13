package com.ascoder1109.legalsaathi.dtos;

import com.ascoder1109.legalsaathi.entities.Lawyer;
import com.ascoder1109.legalsaathi.entities.User;
import lombok.Data;

@Data
public class UserDetailsDTO {

    private Long id;
    private String name;
    private String email;
    private String phoneNumber;
    private String role;
    private boolean available;
    private LawyerDetailsDTO lawyerDetails;


    public UserDetailsDTO(User user) {
        this.id = user.getId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.phoneNumber = user.getPhoneNumber();
        this.role = user.getRole().toString();
        this.available = user.isAvailable();
    }


    public void setLawyerDetails(Lawyer lawyer) {
        this.lawyerDetails = new LawyerDetailsDTO(lawyer);
    }
}
