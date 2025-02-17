//
//  MentoringList.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import Foundation

final class MentoringManager: ObservableObject {
    @Published private(set) var mentoringList: [Mentoring] = []
    
    func fetchMentorings() {
        guard let url = APIPath.getMentoringList.url else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            if let jsonString = String(data: data, encoding: .utf8) {
                print("✅ 응답 데이터: \(jsonString)")
            } else {
                print("❌ 데이터를 문자열로 변환할 수 없습니다.")
            }
            guard let mentoringDTOs = try? JSONDecoder().decode([MentoringDTO].self, from: data) else { return }
            let mentorings = mentoringDTOs.map { $0.DtoToDomain() }
            self.mentoringList.append(contentsOf: mentorings)
        }.resume()
        
        self.mentoringList = dummyMentorings
    }
    
    let dummyMentorings: [Mentoring] = [
        Mentoring(
            id: 101,
            mentor: User(
                id: 1,
                name: "김민석",
                phoneNumber: 1012345678,
                emailAddress: "kimminseok@example.com",
                description: "iOS 개발자 & 멘토",
                profileURL: "https://example.com/profile1.jpg"
            ),
            mentee: [
                User(
                    id: 2,
                    name: "이승훈",
                    phoneNumber: 1087654321,
                    emailAddress: "leeseunghoon@example.com",
                    description: "주니어 개발자",
                    profileURL: "https://example.com/profile2.jpg"
                )
            ],
            finished: false,
            meetingType: .online,
            title: "iOS 앱 개발 입문",
            field: [.iT],
            introduction: "Swift와 UIKit을 활용하여 iOS 앱 개발을 처음부터 배우는 강의입니다.",
            subject: "Swift, UIKit, Xcode",
            method: "온라인 Zoom 강의",
            preparation: "Xcode 설치 필수",
            career: [
                Career(companyName: "네이버", experience: 5, description: "iOS 개발"),
                Career(companyName: "카카오", experience: 3, description: "UX/UI 디자인")
            ]
        ),
        Mentoring(
            id: 102,
            mentor: User(
                id: 2,
                name: "박민수",
                phoneNumber: 1098765432,
                emailAddress: "parkminsu@example.com",
                description: "백엔드 개발자",
                profileURL: "https://example.com/profile4.jpg"
            ),
            mentee: [
                User(
                    id: 4,
                    name: "정윤호",
                    phoneNumber: 1076543210,
                    emailAddress: "jeongyunho@example.com",
                    description: "데이터 엔지니어",
                    profileURL: "https://example.com/profile5.jpg"
                )
            ],
            finished: false,
            meetingType: .offline,
            title: "백엔드 개발 기초",
            field: [.iT],
            introduction: "Spring Boot와 MySQL을 활용하여 백엔드 개발을 시작하는 강의입니다.",
            subject: "Java, Spring Boot, MySQL",
            method: "오프라인 강의",
            preparation: "JDK 설치 및 IntelliJ 준비",
            career: [
                Career(companyName: "라인", experience: 4, description: "백엔드 개발"),
                Career(companyName: "쿠팡", experience: 2, description: "데이터 엔지니어링")
            ]
        ),
        Mentoring(
            id: 103,
            mentor: User(
                id: 3,
                name: "이영희",
                phoneNumber: 1065432109,
                emailAddress: "leeyounghee@example.com",
                description: "UX/UI 디자이너",
                profileURL: "https://example.com/profile6.jpg"
            ),
            mentee: [
                User(
                    id: 5,
                    name: "김지원",
                    phoneNumber: 1043210987,
                    emailAddress: "kimjiwon@example.com",
                    description: "프론트엔드 개발자",
                    profileURL: "https://example.com/profile7.jpg"
                )
            ],
            finished: true,
            meetingType: .online,
            title: "UX/UI 디자인 시스템 구축",
            field: [.design],
            introduction: "Figma를 활용한 UX/UI 디자인 시스템 구축 실습",
            subject: "Figma, Sketch, UX Research",
            method: "온라인 강의",
            preparation: "Figma 계정 가입 필수",
            career: [
                Career(companyName: "배달의민족", experience: 6, description: "UI 디자인"),
                Career(companyName: "토스", experience: 3, description: "UX 연구")
            ]
        )
    ]
    
    func fetchDummyMentorings() {
        if let url = Bundle.main.url(forResource: "dummyData", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let mentorings = try? decoder.decode([Mentoring].self, from: data) {
                self.mentoringList = mentorings
                print("더미 데이터를 로드했습니다.")
            } else {
                print("더미 데이터를 디코딩하는 데 실패했습니다.")
            }
        } else {
            print("더미 데이터 파일을 찾을 수 없습니다.")
        }
    }
}
