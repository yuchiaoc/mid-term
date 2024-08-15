//
//  Question.swift
//  mid-term
//
//  Created by Josie.Chung on 2024/8/15.
//

import Foundation

struct Quiz: Codable {
    let quizTitle: String
    let questions: [Question]
    
    enum CodingKeys: String, CodingKey {
        case quizTitle = "quiz_title"
        case questions
    }
}

struct Question: Codable {
//    let number: Int
    let question: String
    let options: [Option]
    let correctAnswer: String
    let picName: String
    
    enum CodingKeys: String, CodingKey {
        case /*number,*/ question, options
        case correctAnswer = "correct_answer"
        case picName = "pic"
    }
    
    struct Option: Codable {
        let letter: String
        let context: String
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let dict = try container.decode([String: String].self)
            self.letter = dict.keys.first ?? ""
            self.context = dict.values.first ?? ""
        }
    }
}
