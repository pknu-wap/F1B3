package com.f1b3.b3.service;

import com.f1b3.b3.entity.User;
import com.f1b3.b3.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public String signUp(String name, String emailAddress, String password, String phoneNumber, String description, String profileUrl) {
        Optional<User> existingUser = userRepository.findByEmailAddress(emailAddress);
        if (existingUser.isPresent()) {
            return "중복된 이메일입니다.";
        }

        User user = User.builder()
                .name(name)
                .emailAddress(emailAddress)
                .password(password)
                .phoneNumber(phoneNumber)
                .description(description)
                .profileUrl(profileUrl)
                .build();

        userRepository.save(user);
        return "회원 가입 성공";
    }

    public String login(String emailAddress, String password) {
        Optional<User> user = userRepository.findByEmailAddress(emailAddress);

        if (user.isEmpty()) {
            return "이메일이 존재하지 않습니다.";
        }

        if (!user.get().getPassword().equals(password)) {
            return "비밀번호가 일치하지 않습니다.";
        }

        return "로그인 성공";
    }
}
