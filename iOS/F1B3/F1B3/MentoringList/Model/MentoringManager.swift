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
            guard let mentorings = try? JSONDecoder().decode([Mentoring].self, from: data) else { return }
            self.mentoringList.append(contentsOf: mentorings)
        }.resume()
    }
    
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
