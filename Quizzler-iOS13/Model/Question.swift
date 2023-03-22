//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by BETTY JIMENEZ on 21/3/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
       text = q
        answers = a
       rightAnswer = correctAnswer
    }
    
}
