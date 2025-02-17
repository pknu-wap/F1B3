package com.f1b3.b3.repository;

import com.f1b3.b3.constance.MeetingType;
import com.f1b3.b3.entity.Career;
import com.f1b3.b3.entity.Mentoring;
import com.f1b3.b3.entity.User;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
class MentoringRepositoryTest {

    @Autowired
    private MentoringRepository mentoringRepository;

    @Autowired
    private CareerRepository careerRepository;

    @Autowired
    private UserRepository userRepository;

    private User user1;
    private User user2;

    @BeforeEach
    void setup() {
        user1 = User.builder()
                .name("John Doe")
                .emailAddress("john.doe@example.com")
                .phoneNumber("010-1234-5678")
                .description("Experienced in software engineering and mentorship.")
                .profileUrl("http://example.com/john_profile")
                .build();

        user2 = User.builder()
                .name("Jane Smith")
                .emailAddress("jane.smith@example.com")
                .phoneNumber("010-2345-6789")
                .description("Passionate about data science and mentoring others.")
                .profileUrl("http://example.com/jane_profile")
                .build();

        userRepository.save(user1);
        userRepository.save(user2);
    }

    @Test
    //@MethodSource("createDummyMentoring")
    void testSaveAndFind() throws Exception {
        //given
        Mentoring mentoring = Mentoring.builder()
                .title("Advanced Software Engineering Mentorship")
                .field("Software Engineering")
                .introduction("In-depth mentorship for software engineering skills, with hands-on projects.")
                .subject("Programming, System Design, Problem Solving")
                .method("Online, 1-on-1 sessions")
                .preparation("Bring your own laptop, basic knowledge of algorithms is recommended.")
                .price(50000)
                .mentoringTime("Every Monday 10:00 AM - 12:00 PM")
                .meetingType(MeetingType.ONLINE) // Assuming ONLINE is part of MeetingType enum
                .finished(false)
                .career(List.of(Career.builder().experience(5).companyName("wap").build()))
                .mentee(Arrays.asList(user1, user2))
                .build();

        //when
        Mentoring save = mentoringRepository.save(mentoring);

        //then
        List<Mentoring> found = mentoringRepository.findAll();
        assertTrue(found.contains(mentoring));
        assertEquals(1, found.size());
    }
}