package com.f1b3.b3.repository;

import com.f1b3.b3.entity.User;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    void testSaveAndFind() throws Exception {
        //given
        User john = User.builder()
                .name("John Doe")
                .emailAddress("john.doe@example.com")
                .phoneNumber("010-1234-5678")
                .description("A passionate developer.")
                .profileUrl("http://example.com/johndoe")
                .build();

        //when
        userRepository.save(john);

        //then
        List<User> found = userRepository.findAll();
        assertTrue(found.contains(john));
        assertEquals(1, found.size());
    }
}