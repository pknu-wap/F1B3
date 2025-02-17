package com.f1b3.b3.payload.request;

import com.f1b3.b3.constance.MeetingType;
import com.f1b3.b3.entity.Career;
import com.f1b3.b3.entity.Mentoring;
import com.f1b3.b3.entity.User;
import com.f1b3.b3.payload.CareerDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Builder
@Getter
@AllArgsConstructor
public class MentoringCreateRequest {

    private String title;

    private String field;

    private String introduction;

    private String subject;

    private String method;

    private String preparation;

    private String meetingType;

    private Integer price;

    private String mentoringTime;

    private List<CareerDto> career;

    public Mentoring toEntity(User mentor) {
        List<Career> careers = career.stream().map(CareerDto::toEntity).toList();

        return Mentoring.builder()
                .meetingType(MeetingType.valueOf(meetingType))
                .title(title)
                .field(field)
                .introduction(introduction)
                .subject(subject)
                .method(method)
                .preparation(preparation)
                .price(price)
                .mentoringTime(mentoringTime)
                .finished(false)
                .career(careers)
                .mentor(mentor)
                .build();
    }
}
