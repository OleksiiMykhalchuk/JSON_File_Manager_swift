//
//  main.swift
//  JSONManager
//
//  Created by Oleksii Mykhalchuk on 9/6/22.
//

import Foundation

let filePath = "file:///Users/imac/Documents"
let fileName = "collection.json"
let toFileName = "toCollection.json"
let url: URL? = URL(fileURLWithPath: filePath)
var toQuiz: ToQuiz
var collection: [ToItem] = []

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

struct ToQuiz: Codable {
    var quiz: [ToItem]
}

struct ToItem: Codable {
    let question: String
    let category: String
    let choices: [Choices]
}

if let file = url?.appendingPathComponent(fileName) {
    do {
        let data = try Data(contentsOf: file, options: .mappedIfSafe)
        let decoder = JSONDecoder()
        let quiz = try decoder.decode(Quiz.self, from: data)
        var counter = 0
        var category = ""

        quiz.quiz.forEach { items in
            if counter == 0 {
                category = "placementTest"
            } else {
                category = "sentences"
            }
            items.forEach { item in
                var toItem = ToItem(question: item.question, category: category, choices: item.choices)
                collection.append(toItem)
            }
            counter += 1
        }
    } catch {
        print("\(error)")
    }
} else {
    print("The file is missing")
}

toQuiz = ToQuiz(quiz: collection)

if let path = url?.appendingPathComponent(toFileName) {
    do {
        let encoder = JSONEncoder()
        let encode = try encoder.encode(toQuiz)
        try encode.write(to: path)
    } catch {
        print(error)
    }
}



