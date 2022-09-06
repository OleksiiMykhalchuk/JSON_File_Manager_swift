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

let jsonFileManager = try? JSONFileManager(
    filePath: filePath,
    fileName: fileName,
    toFileName: toFileName,
    fromModel: Quiz.self,
    toModel: ToQuiz.self,
    forEach: { item -> ToQuiz in
        var toItems: [ToItem] = []
        var category = ""
        var counter = 0
        item.quiz.forEach { items in
            switch counter {
            case 0:
                category = "placementTest"
            case 1:
                category = "sentences"
            default:
                category = ""
            }
            items.forEach { item in
                let toItem = ToItem(question: item.question, category: category, choices: item.choices)
                toItems.append(toItem)
            }
            counter += 1
        }
        return ToQuiz(quiz: toItems)
    })
