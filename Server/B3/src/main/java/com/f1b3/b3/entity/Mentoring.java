package com.f1b3.b3.entity;

import com.f1b3.b3.constance.MeetingType;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Data
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Mentoring {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="metoring_id")
    private Long id;

    @Column(name="finished")
    private boolean finished;

    @Column(name="meeting_type")
    private MeetingType meetingType;

    @Column(name="title")
    private String title;

    @Column(name="field")
    private String field;

    @Column(name="introduction")
    private String introduction;

    @Column(name="subject")
    private String subject;

    @Column(name="method")
    private String method;

    @Column(name="preparation")
    private String preparation;

    @Column(name="price")
    private double price;

    @Column(name="metoring_time")
    private String mentoringTime;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name="career_id")
    private List<Career> career;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name="mentee_id")
    private List<User> mentee;

    @Builder
    public Mentoring(String title, String field, String introduction, String subject, String method, String preparation) {
        this.title = title;
        this.field = field;
        this.introduction = introduction;
        this.subject = subject;
        this.method = method;
        this.preparation = preparation;
    }
}
