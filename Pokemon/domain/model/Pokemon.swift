//
//  Pokemon.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import Foundation

struct Pokemon {
    let abilities: [Ability]
    let baseExperience: Int
    let cries: Cries?
    let forms: [Species]
    let height: Int
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let name: String
    let order: Int
    let species: Species?
    let weight: Int
}
