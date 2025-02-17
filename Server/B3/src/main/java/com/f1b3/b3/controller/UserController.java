package com.f1b3.b3.controller;

import com.f1b3.b3.entity.User;
import com.f1b3.b3.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/signup")
    public String signUp(@RequestBody User user) {
        return userService.signUp(
                user.getName(),
                user.getEmailAddress(),
                user.getPassword(),
                user.getPhoneNumber(),
                user.getDescription(),
                user.getProfileUrl()
        );
    }

    @PostMapping("/login")
    public String login(@RequestBody User loginRequest) {
        return userService.login(loginRequest.getEmailAddress(), loginRequest.getPassword());
    }
}
