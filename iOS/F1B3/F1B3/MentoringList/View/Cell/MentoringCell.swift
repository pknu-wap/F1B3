//
//  MentoringCell.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import SwiftUI

struct MentoringCell: View {
    
    let mentoring: Mentoring
    
    var body: some View {
        VStack(alignment: .leading) {
            MentoringCellHeaderView(
                fieldString: mentoring.fieldString,
                mentorName: mentoring.mentor.name
            )
            
            Divider()
            
            MentoringCellBodyView(
                title: mentoring.title,
                careerValue: mentoring.careerValue,
                fieldString: mentoring.fieldString,
                meetingType: mentoring.meetingType.rawValue
            )
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(1), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Cell Header View

struct MentoringCellHeaderView: View {
    let fieldString: String
    let mentorName: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(fieldString)
                    .font(.system(size: 16))
                    .foregroundColor(Color.gray)
                Text(mentorName)
                    .font(.system(size: 20, weight: .semibold))
            }
            
            Spacer()
            
            Image(systemName: "person")
                .frame(width: 50, height: 50)
                .background(Color.red)
                .cornerRadius(50)
        }
    }
}

// MARK: - Cell Body View

struct MentoringCellBodyView: View {
    let title: String
    let careerValue: String
    let fieldString: String
    let meetingType: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
            descriptionView(title: "경력", description: careerValue)
            descriptionView(title: "분야", description: fieldString)
            descriptionView(title: "진행방식", description: meetingType)
        }
    }
}

struct descriptionView: View {
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(Color.gray)
            Text(description)
                .font(.system(size: 14))
        }
        .padding(.leading, 10)
    }
}

// MARK: - Previews

struct MentoringCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("BackgroundMain").edgesIgnoringSafeArea(.all)
            VStack {
                MentoringCell(mentoring: dummyMentoring) // ✅ 더미 데이터 연결
            }
            .padding()
        }
    }
}

let dummyMentoring = Mentoring(
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
        ),
        User(
            id: 3,
            name: "박지현",
            phoneNumber: 1055556666,
            emailAddress: "parkjihyun@example.com",
            description: "UI/UX 디자이너",
            profileURL: "https://example.com/profile3.jpg"
        )
    ],
    finished: false,
    meetingType: .online,
    title: "iOS 앱 개발 입문",
    field: [.iT], // ✅ `Field` 열거형 사용
    introduction: "Swift와 UIKit을 활용하여 iOS 앱 개발을 처음부터 배우는 강의입니다.",
    subject: "Swift, UIKit, Xcode",
    method: "온라인 Zoom 강의",
    preparation: "Xcode 설치 필수",
    career: [
        Career(companyName: "네이버", experience: 5, description: "iOS 개발"),
        Career(companyName: "카카오", experience: 3, description: "UX/UI 디자인")
    ]
)

/*
// MARK: - Preview

struct MentoringCell_Previews: PreviewProvider {
    static var previews: some View {
        MentoringPreviewWrapper()
    }
}

struct MentoringPreviewWrapper: View {
    @StateObject private var mentoringManager = MentoringManager()
    
    var body: some View {
        ZStack {
            VStack {
                if let firstMentoring = mentoringManager.mentoringList.first {
                    MentoringCell(mentoring: firstMentoring)
                } else {
                    Text("Loading dummy data...")
                        .foregroundColor(.gray)
                }
            }
            .padding()
        }
        .onAppear {
            mentoringManager.fetchDummyMentorings()
        }
    }
}

*/
