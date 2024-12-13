    package com.ascoder1109.legalsaathi.dtos;

    import com.ascoder1109.legalsaathi.entities.LawyerSpecialization;
    import lombok.Data;


    @Data
    public class ChangeRoleToLawyerRequestDTO {
        private LawyerSpecialization lawyerSpecialization;
        private String barCouncilId;
        private int experience;
        private String firmName;
        private String officeAddress;
    }
