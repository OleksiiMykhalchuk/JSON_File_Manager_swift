//
//  Managable.swift
//  JSONManager
//
//  Created by Oleksii Mykhalchuk on 9/6/22.
//

import Foundation

protocol Managable {
    init<E: Encodable, D: Decodable>(
        filePath: String,
        fileName: String,
        toFileName: String,
        fromModel: D.Type,
        toModel: E.Type,
        forEach: (D) -> E) throws
}

