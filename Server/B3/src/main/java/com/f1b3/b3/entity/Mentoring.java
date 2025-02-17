package com.f1b3.b3.entity;

import com.f1b3.b3.constance.MeetingType;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Mentoring {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mentoring_id")
    private Long id;

    @Column(name = "finished")
    private boolean finished;

    @Column(name = "meeting_type")
    private MeetingType meetingType;

    @Column(name = "title")
    private String title;

    @Column(name = "field")
    private String field;

    @Column(name = "introduction")
    private String introduction;

    @Column(name = "subject")
    private String subject;

    @Column(name = "method")
    private String method;

    @Column(name = "preparation")
    private String preparation;

    @Column(name = "price")
    private Integer price;

    @Column(name = "mentoring_time")
    private String mentoringTime;

    @OneToMany(mappedBy = "mentoring", cascade = CascadeType.ALL, orphanRemoval = true)
//    @JoinColumn(name = "career_id")
    private List<Career> career = new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "mentee_id")
    private List<User> mentee = new ArrayList<>();

    @Builder
    public Mentoring(MeetingType meetingType,
                     String title, String field,
                     String introduction,
                     String subject,
                     String method,
                     String preparation,
                     Integer price,
                     String mentoringTime,
                     boolean finished,
                     List<Career> career,
                     List<User> mentee) {
        this.finished = finished;
        this.meetingType = meetingType;
        this.title = title;
        this.field = field;
        this.introduction = introduction;
        this.subject = subject;
        this.method = method;
        this.preparation = preparation;
        this.mentoringTime = mentoringTime;
        this.career = career;
        this.mentee = mentee;
        this.price = price;
    }
}
