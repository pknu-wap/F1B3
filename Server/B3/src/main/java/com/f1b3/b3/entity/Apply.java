package com.f1b3.b3.entity;

import jakarta.persistence.*;

@Entity
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
}
