//
//  PokemonApi.swift
//  Pokemon
//
//  Created by Gabor Pinter on 10/09/2024.
//

import Moya
import Foundation

enum PokemonApi {
    case list
    case detail(name: String)
}

extension PokemonApi: TargetType {
    var baseURL: URL { URL(string: "https://pokeapi.co/api/v2/pokemon")! }

    var path: String {
        switch self {
        case .list: ""
        case .detail(let name): "/\(name)"
        }
    }

    var method: Moya.Method { .get }

    var task: Moya.Task { .requestPlain }

    var headers: [String : String]? { nil }
}
