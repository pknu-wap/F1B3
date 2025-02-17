//
//  Mentoring.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import Foundation

struct Mentoring {
    let id: Int
    let mentorID: User
    let menteeID: [User]
    let finished: Bool
    let meetingType: MeetingType
    let title: String
    let field: [Field]
    let introduction: String
    let subject: String
    let method: String
    let preparation: String
    let career: [Career]
    
    var fieldString: String {
        field.map { $0.value }.joined(separator: ", ")
    }
    
    var careerValue: String {
        let totalExperience = career.reduce(0) { $0 + $1.experience }
        let companyNames = career.map { $0.companyName }.joined(separator: ", ")

        return "\(companyNames) (\(totalExperience)년차)"
    }
}

extension Mentoring: Hashable, Codable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Mentoring, rhs: Mentoring) -> Bool {
        lhs.id == rhs.id
    }
}

enum Field: String, Codable {
    case iT = "IT"
    case design = "Design"
    
    var value: String {
        return self.rawValue
    }
}

struct Career: Codable {
    let companyName: String
    let experience: Int
    let description: String?
}

enum MeetingType: String, Codable {
    case online = "온라인"
    case offline = "오프라인"
    case blended = "혼합"
}
