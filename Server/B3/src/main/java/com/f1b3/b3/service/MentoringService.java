package com.f1b3.b3.service;

import com.f1b3.b3.constance.MeetingType;
import com.f1b3.b3.entity.Mentoring;
import com.f1b3.b3.repository.MentoringRepository;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MentoringService {

    private final MentoringRepository mentoringRepository;

    @PostConstruct
    public void insertTestData() {
        if (mentoringRepository.count() == 0) { // 기존 데이터 없을 때만 추가
            List<Mentoring> mentorings = Arrays.asList(
                    Mentoring.builder()
                            .title("Java 백엔드 멘토링")
                            .field("Backend")
                            .introduction("Spring Boot 기반 백엔드 개발 입문")
                            .subject("Spring Boot")
                            .method("온라인 미팅")
                            .preparation("기본적인 Java 문법 학습")
                            .price(2000)
                            .mentoringTime("월요일")
                            .meetingType(MeetingType.ONLINE)
                            .build()
            );
            mentoringRepository.saveAll(mentorings);
        }
    }

    public List<Mentoring> getAllMentorings() {
        return mentoringRepository.findAll();
    }
}