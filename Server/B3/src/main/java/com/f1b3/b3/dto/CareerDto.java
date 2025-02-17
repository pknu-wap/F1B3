package com.f1b3.b3.dto;

import com.f1b3.b3.entity.Career;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
@AllArgsConstructor
public class CareerDto {

    private String companyName;

    private Integer experience;

    private String description;

    public Career toEntity() {
        return Career.builder()
                .companyName(companyName)
                .experience(experience)
                .description(description)
                .build();
    }
}
