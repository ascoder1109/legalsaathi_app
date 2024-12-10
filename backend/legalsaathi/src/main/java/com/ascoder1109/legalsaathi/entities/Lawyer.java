package com.ascoder1109.legalsaathi.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@Table(name = "lawyers")
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Lawyer {

    @Id
    @EqualsAndHashCode.Include
    private Long id;

    @OneToOne
    @MapsId
    @JoinColumn(name = "id")
    private User user;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private LawyerSpecialization lawyerSpecialization;

    @Column(nullable = false, unique = true)
    @Pattern(regexp = "\\w+", message = "Bar Council ID must contain only alphanumeric characters")
    private String barCouncilId;

    @Column
    @Min(value = 0, message = "Experience cannot be negative")
    private int experience;

    @Column
    @Size(max = 100, message = "Firm name cannot exceed 100 characters")
    private String firmName;

    @Column
    @Size(max = 255, message = "Office address cannot exceed 255 characters")
    private String officeAddress;

    @Column(updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt = new Date();

    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;

    @PreUpdate
    public void preUpdate() {
        this.updatedAt = new Date();
    }
}
