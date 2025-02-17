package com.f1b3.b3.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Career {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="career_id")
    private Long id;
    @Column(name="company_name")
    private String companyName;
    @Column(name="experience")
    private String experience;
    @Column(name="description")
    private String description;

    /*
    @ManyToOne
    @JoinColumn(name = "mentoring_id")
    private Mentoring mentoring;

     */

    @Builder
    public Career(String companyName, String experience, String description) {
        this.companyName = companyName;
        this.experience = experience;
        this.description = description;
    }
}
