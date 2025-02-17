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
    let meetingType: MeetingType? // 이놈 널?
    let title: String?
    let field: [Field] // enum 아닌가요?
    let introduction: String?
    let subject: String?
    let method: String?
    let preparation: String?
    let price: Int? // double인가요?
    let mentoringTime: Date? // Date인가요?
    let career: [Career]? // enum인가요?
    let mentor: User // 멘토 없나요?
    let mentee: [User]? 
    
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
            mentor: self.mentor,
            mentee: self.mentee ?? [],
            finished: self.finished,
            meetingType: self.meetingType ?? .online,
            title: self.title ?? "제목이 없습니다",
            field: self.field,
            introduction: self.introduction ?? "소개가 없습니다",
            subject: self.subject ?? "주제가 없습니다",
            method: self.method ?? "멘토링 방식이 없습니다",
            preparation: self.preparation ?? "준비물이 없습니다",
            career: self.career ?? []
        )
    }
}
