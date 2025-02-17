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
    
}
