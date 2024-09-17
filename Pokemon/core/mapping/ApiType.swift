//
//  ApiType.swift
//  Pokemon
//
//  Created by Gabor Pinter on 13/09/2024.
//

protocol ApiType {
    associatedtype Api
    func toApi() -> Api
}

extension Set: ApiType where Element: ApiType {
    func toApi() -> [Element.Api] {
        map { $0.toApi() }
    }
}

extension Array: ApiType where Element: ApiType {
    func toApi() -> [Element.Api] {
        map { $0.toApi() }
    }
}
