//
//  Question.swift
//  Quizzler
//
//  Created by Анастасия Ларина on 19.02.2021.
//

import Foundation

struct Question {
    let text: String
    let answearOptions: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], ca: String) {
        text = q
        answearOptions = a
        correctAnswer = ca
    }
}
