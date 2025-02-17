package com.f1b3.b3.dto;

import com.f1b3.b3.entity.Career;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class CareerDetail {
    private Long id;
    private String companyName;
    private Integer experience;
    private String description;

    public static CareerDetail of(Career career) {
        return CareerDetail.builder()
                .id(career.getId())
                .companyName(career.getCompanyName())
                .experience(career.getExperience())
                .description(career.getDescription())
                .build();
    }
}
