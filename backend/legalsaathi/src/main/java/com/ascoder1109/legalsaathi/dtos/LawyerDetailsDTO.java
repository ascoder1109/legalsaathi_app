package com.ascoder1109.legalsaathi.dtos;

import com.ascoder1109.legalsaathi.entities.Lawyer;
import lombok.Data;

@Data
public class LawyerDetailsDTO {

    private String lawyerSpecialization;
    private String barCouncilId;
    private int experience;
    private String firmName;
    private String officeAddress;

    public LawyerDetailsDTO(Lawyer lawyer) {
        this.lawyerSpecialization = lawyer.getLawyerSpecialization().toString();
        this.barCouncilId = lawyer.getBarCouncilId();
        this.experience = lawyer.getExperience();
        this.firmName = lawyer.getFirmName();
        this.officeAddress = lawyer.getOfficeAddress();
    }
}
