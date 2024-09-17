//
//  AbilityApi.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import Foundation

struct AbilityApi: Decodable {
    let ability: SpeciesApi?
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}
