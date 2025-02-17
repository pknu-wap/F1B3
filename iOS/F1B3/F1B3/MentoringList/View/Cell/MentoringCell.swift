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
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(mentoring.fieldString)
                        .font(.system(size: 16))
                        .foregroundColor(Color.gray)
                    Text(mentoring.mentorID.name)
                        .font(.system(size: 20, weight: .bold))
                }
                Spacer()
                Image(systemName: "person")
                    .frame(width: 50, height: 50)
                    .background(Color.red)
                    .cornerRadius(50)
            }
        }
    }
    
    var 
}

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
    mentorID: User(
        id: 1,
        name: "김민석",
        phoneNumber: 1012345678,
        emailAddress: "kimminseok@example.com",
        description: "iOS 개발자 & 멘토",
        profileURL: "https://example.com/profile1.jpg"
    ),
    menteeID: [
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
        Career(companyName: "네이버", years: Date(), description: "iOS 개발"),
        Career(companyName: "카카오", years: Date(), description: "UX/UI 디자인")
    ]
)

