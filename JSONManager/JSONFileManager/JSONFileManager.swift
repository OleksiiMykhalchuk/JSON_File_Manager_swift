//
//  JSONFileManager.swift
//  JSONManager
//
//  Created by Oleksii Mykhalchuk on 9/6/22.
//

import Foundation

struct JSONFileManager: Managable {

    private let url: URL
    enum ErrorData: Error, LocalizedError {
        case errorReading
    }

    init<E, D>(
        filePath: String,
        fileName: String,
        toFileName: String,
        fromModel: D.Type,
        toModel: E.Type,
        forEach: (D) -> E) throws where E : Encodable, D : Decodable {
        self.url = URL(fileURLWithPath: filePath)
            if let data = try readFile(fromModel: fromModel, fileName: fileName) {
                let result = forEach(data)
                try writeFile(toModel: result, toFileName: toFileName)
            } else {
                throw ErrorData.errorReading
            }
    }

    private func readFile<D: Decodable>(fromModel: D.Type, fileName: String) throws -> D? {
        let decoder = JSONDecoder()
        let filePath = url.appendingPathComponent(fileName)
        let data = try Data(contentsOf: filePath, options: .mappedIfSafe)
        return try decoder.decode(D.self, from: data)
    }

    private func writeFile<E: Encodable>(toModel: E, toFileName: String) throws {
        let encoder = JSONEncoder()
        let filePath = url.appendingPathComponent(toFileName)
        let result = try encoder.encode(toModel)
        try result.write(to: filePath)
    }
}
