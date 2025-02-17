//
//  MentoringDTO.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import Foundation

struct MentoringDTO: Hashable, Codable {
    let id: Int
    let finished: Bool
    let meetingType: String?
    let title: String?
    let field: String?
    let introduction: String?
    let subject: String?
    let method: String?
    let preparation: String?
    let price: Int?
    let mentoringTime: String?
    let career: [Career]?
    let mentor: User?
    let mentee: [User]?
    
    // TODO: - id 상수값 변경 예정
    init() {
        self.id = 1234
        self.finished = false
        self.meetingType = nil
        self.title = nil
        self.field = nil
        self.introduction = nil
        self.subject = nil
        self.method = nil
        self.preparation = nil
        self.price = nil
        self.mentoringTime = nil
        self.career = nil
        self.mentor = User(id: 123, name: "김민석", phoneNumber: 01011112222, emailAddress: "alstjr7437@naver.com", description: "", profileURL: "")
        self.mentee = nil
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MentoringDTO, rhs: MentoringDTO) -> Bool {
        lhs.id == rhs.id
    }
}

extension MentoringDTO {
    func DtoToDomain() -> Mentoring {
        return Mentoring(
            id: self.id,
            mentor: self.mentor ?? User(
                id: 2321,
                name: "이름이 없어요",
                phoneNumber: 010,
                emailAddress: "",
                description: "",
                profileURL: ""
            ),
            mentee: self.mentee ?? [],
            finished: self.finished,
            meetingType: MeetingType(rawValue: self.meetingType ?? "OffLine") ?? .offline,
            title: self.title ?? "제목이 없습니다",
            field: self.field ?? "IT",
            introduction: self.introduction ?? "소개가 없습니다",
            subject: self.subject ?? "주제가 없습니다",
            method: self.method ?? "멘토링 방식이 없습니다",
            preparation: self.preparation ?? "준비물이 없습니다",
            career: self.career ?? []
        )
    }
}
