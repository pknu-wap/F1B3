package com.f1b3.b3.service;

import com.f1b3.b3.constance.MeetingType;
import com.f1b3.b3.dto.CareerDetail;
import com.f1b3.b3.dto.MentoringDetail;
import com.f1b3.b3.entity.Mentoring;
import com.f1b3.b3.repository.MentoringRepository;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MentoringService {

    private final MentoringRepository mentoringRepository;

    @Transactional(readOnly = true)
    public MentoringDetail getMentoringById(Long id) {
        Mentoring mentoring = mentoringRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("해당 공고가 존재하지 않습니다. id: " + id));
        return convertToDetailDto(mentoring);
    }


    @PostConstruct
    public void insertTestData() {
        if (mentoringRepository.count() == 0) {
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

    private MentoringDetail convertToDetailDto(Mentoring mentoring) {
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
                .finished(mentoring.isFinished())
                .careers(mentoring.getCareer().stream()
                        .map(CareerDetail::of)
                        .collect(Collectors.toList()))
                .build();
    }
}