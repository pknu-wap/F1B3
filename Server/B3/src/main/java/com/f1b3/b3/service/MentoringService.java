package com.f1b3.b3.service;

import com.f1b3.b3.constance.MeetingType;
import com.f1b3.b3.entity.Mentoring;
import com.f1b3.b3.entity.User;
import com.f1b3.b3.payload.request.MentoringCreateRequest;
import com.f1b3.b3.repository.MentoringRepository;
import com.f1b3.b3.repository.UserRepository;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MentoringService {

    private final MentoringRepository mentoringRepository;
    private final UserRepository userRepository;

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
                            .meetingType(MeetingType.ONLINE)
                            .build(),
                    Mentoring.builder()
                            .title("프론트엔드 React 멘토링")
                            .field("Frontend")
                            .introduction("React와 TypeScript를 활용한 웹 개발")
                            .subject("React, TypeScript")
                            .method("온라인 미팅")
                            .meetingType(MeetingType.ONLINE)
                            .preparation("HTML, CSS, JS 기본 학습")
                            .build(),
                    Mentoring.builder()
                            .title("데이터 분석 기초")
                            .field("Data Science")
                            .introduction("Python을 활용한 데이터 분석 및 시각화")
                            .subject("Pandas, NumPy")
                            .method("오프라인 미팅")
                            .preparation("Python 기본 문법 학습")
                            .meetingType(MeetingType.ONLINE)
                            .build()
            );
            mentoringRepository.saveAll(mentorings);
        }
    }

    public List<Mentoring> getAllMentorings() {
        return mentoringRepository.findAll();
    }

    public String save(MentoringCreateRequest mentoringRequest, Long mentorId) {
        // 멘토 id를 우선적으로 조회
        Optional<User> mentor = userRepository.findById(mentorId);

        if (mentor.isPresent()) {
            User foundMentor = mentor.get();

            // 멘토링 entity로 전환 후 save
            mentoringRepository.save(mentoringRequest.toEntity(foundMentor));
            return "등록되었습니다.";
        }
        return "존재하지 않는 사용자입니다.";
    }
}