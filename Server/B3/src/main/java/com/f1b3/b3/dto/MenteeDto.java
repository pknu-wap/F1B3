package com.f1b3.b3.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
@AllArgsConstructor
public class MenteeDto {

    private Long userId;

    private String email;
}
