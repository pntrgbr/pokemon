//
//  PokemonApiModel.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import Foundation

struct PokemonApiModel: Decodable {
    let abilities: [AbilityApi]
    let baseExperience: Int
    let cries: CriesApi?
    let forms: [SpeciesApi]
    let height: Int
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let name: String
    let order: Int
    let species: SpeciesApi?
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case cries, forms
        case height
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case name, order
        case species, weight
    }
}
