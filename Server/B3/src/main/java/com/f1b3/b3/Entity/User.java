package com.f1b3.b3.Entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="user_id")
    private Long id;
    @Column(name="user_name")
    private String name;
    @Column(name="email_adrress")
    private String emailAddress;
    @Column(name="phone_number")
    private String phoneNumber;
    @Column(name="description")
    private String description;
    @Column(name="profile_url")
    private String profileUrl;

    @Builder
    public User(String name, String emailAddress, String phoneNumber, String description, String profileUrl) {
        this.name = name;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.description = description;
        this.profileUrl = profileUrl;
    }
}


