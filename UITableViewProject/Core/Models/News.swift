//
//  News.swift
//  UITableViewProject
//
//  Created by Саидов Тимур on 18.02.2022.
//

import Foundation

struct News: Decodable {

    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMMM d, yyyy"
        df.locale = Locale(identifier: "en_EN")
        return df
    }()
    
    struct Article: Decodable {
        let author, title, description, publishedAt: String

        var publishedAtString: String {
            return News.dateFormatter.string(from: self.publishedAt.toDate() ?? Date())
        }

        enum CodingKeys: String, CodingKey {
            case author, title, description, publishedAt
        }
    }

    let articles: [Article]
}
