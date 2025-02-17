//
//  APIPath.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import Foundation

enum APIPath {
    case getMentoringList
    
    var url: URL? {
        switch self {
        case .getMentoringList:
            return URL(string: Config.BASE_URL + "/mentoring/list")
        }
    }
}
