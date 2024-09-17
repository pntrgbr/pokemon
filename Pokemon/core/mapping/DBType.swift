//
//  DBType.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

protocol DBType {
    associatedtype DB
    func toDB() -> DB
}

extension Set: DBType where Element: DBType {
    func toDB() -> [Element.DB] {
        map { $0.toDB() }
    }
}

extension Array: DBType where Element: DBType {
    func toDB() -> [Element.DB] {
        map { $0.toDB() }
    }
}
