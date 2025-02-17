package com.f1b3.b3.dto;

import com.f1b3.b3.constance.MeetingType;
import com.f1b3.b3.entity.Mentoring;
import lombok.Builder;
import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@Builder
public class MentoringDetail {
    private Long id;
    private boolean finished;
    private MeetingType meetingType;
    private String title;
    private String field;
    private String introduction;
    private String subject;
    private String method;
    private String preparation;
    private Integer price;
    private String mentoringTime;
    private List<CareerDetail> careers;

    public static MentoringDetail of(Mentoring mentoring) {
        return MentoringDetail.builder()
                .id(mentoring.getId())
                .meetingType(mentoring.getMeetingType())
                .title(mentoring.getTitle())
                .field(mentoring.getField())
                .introduction(mentoring.getIntroduction())
                .subject(mentoring.getSubject())
                .method(mentoring.getMethod())
                .preparation(mentoring.getPreparation())
                .price(mentoring.getPrice())
                .mentoringTime(mentoring.getMentoringTime())
                .careers(mentoring.getCareer().stream()
                        .map(CareerDetail::of)
                        .collect(Collectors.toList()))
                .finished(mentoring.isFinished())
                .build();
    }
}
