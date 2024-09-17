//
//  DomainType.swift
//  Pokemon
//
//  Created by Gabor Pinter on 13/09/2024.
//

protocol DomainType {
    associatedtype Domain
    func toDomain() -> Domain
}

extension Set: DomainType where Element: DomainType {
    func toDomain() -> [Element.Domain] {
        map { $0.toDomain() }
    }
}

extension Array: DomainType where Element: DomainType {
    func toDomain() -> [Element.Domain] {
        map { $0.toDomain() }
    }
}
