package com.f1b3.b3.controller;

import com.f1b3.b3.entity.Mentoring;
import com.f1b3.b3.dto.MentoringDetail;
import com.f1b3.b3.service.MentoringService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
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

    @GetMapping("/{id}")
    public ResponseEntity<MentoringDetail> getMentoring(@PathVariable Long id) {
        MentoringDetail mentoringDetail = mentoringService.getMentoringById(id);
        return ResponseEntity.ok(mentoringDetail);
    }
}