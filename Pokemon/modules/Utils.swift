//
//  Utils.swift
//  Pokemon
//
//  Created by Gabor Pinter on 18/09/2024.
//

import Foundation

enum Utils {
    static func getUrl(id: Int) -> URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }
}
