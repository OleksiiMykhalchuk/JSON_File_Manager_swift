//
//  ToDataModel.swift
//  JSONManager
//
//  Created by Oleksii Mykhalchuk on 9/6/22.
//

import Foundation

struct ToQuiz: Codable {
    var quiz: [ToItem]
}

struct ToItem: Codable {
    let question: String
    let category: String
    let choices: [Choices]
}
