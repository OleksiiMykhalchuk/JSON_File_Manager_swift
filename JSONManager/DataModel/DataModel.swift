//
//  DataModel.swift
//  JSONManager
//
//  Created by Oleksii Mykhalchuk on 9/6/22.
//

import Foundation

struct Quiz: Codable {
    var quiz: [[Item]]
}
struct Item: Codable {
    let question: String
    let choices: [Choices]
}
struct Choices: Codable {
    let correct: Bool
    let text: String
}
