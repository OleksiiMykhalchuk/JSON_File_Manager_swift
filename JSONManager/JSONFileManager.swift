//
//  JSONFileManager.swift
//  JSONManager
//
//  Created by Oleksii Mykhalchuk on 9/6/22.
//

import Foundation

protocol Managable {
    var filePath: String { get }
    var fileName: String { get }
    var toFileName: String { get }

    init(filePath: String, fileName: String, toFileName: String)

    func readFrom(filePath: String)
    func writeTo(filePath: String)
}
