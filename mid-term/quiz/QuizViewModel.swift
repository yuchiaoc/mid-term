//
//  QuizViewModel.swift
//  mid-term
//
//  Created by Josie.Chung on 2024/8/15.
//

import Foundation

class QuizViewModel {
    
    func loadQuizData() -> Quiz? {
        guard let url = Bundle.main.url(forResource: "quiz", withExtension: "json") else {
            print("無法找到 quiz.json 文件")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let quiz = try JSONDecoder().decode(Quiz.self, from: data)
            return quiz
        } catch {
            print("解析 JSON 時發生錯誤: \(error)")
            return nil
        }
    }
    
    func getRandomQuestions(questions: [Question], count: Int) -> [Question]? {
        if questions.count < count {
            return nil
        }
        return Array(questions.shuffled().prefix(count))
    }
}
