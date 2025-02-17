package com.f1b3.b3.controller;

import com.f1b3.b3.entity.Mentoring;
import com.f1b3.b3.dto.MentoringCreateRequest;
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

    @PostMapping("/{userId}")
    public ResponseEntity<?> createMentoring(@PathVariable Long userId,
                                             @RequestBody MentoringCreateRequest mentoringCreateRequest) {
        String result = mentoringService.save(mentoringCreateRequest, userId);
        if (result.equals("등록되었습니다.")) {
            return ResponseEntity.status(201).body(result);
        }
        return ResponseEntity.status(401).body(result);

    @GetMapping("/{id}")
    public ResponseEntity<MentoringDetail> getMentoring(@PathVariable Long id) {
        MentoringDetail mentoringDetail = mentoringService.getMentoringById(id);
        return ResponseEntity.ok(mentoringDetail);
    }
}