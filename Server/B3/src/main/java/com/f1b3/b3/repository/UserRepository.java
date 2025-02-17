package com.f1b3.b3.repository;

import com.f1b3.b3.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
