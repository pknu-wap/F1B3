package com.f1b3.b3.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Apply {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "mentoring_id")
    private Mentoring mentoring;

    public static Apply of(User user, Mentoring mentoring) {
        return Apply.builder()
                .user(user)
                .mentoring(mentoring)
                .build();
    }
}
