package com.f1b3.b3.controller;

import com.f1b3.b3.entity.Mentoring;
import com.f1b3.b3.service.MentoringService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/mentoring")
@RequiredArgsConstructor
public class MentoringController {

    private final MentoringService mentoringService;

    @GetMapping("/list")
    public List<Mentoring> getAllMentorings() {
        return mentoringService.getAllMentorings();
    }
}