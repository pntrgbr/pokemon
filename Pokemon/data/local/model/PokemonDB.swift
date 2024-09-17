//
//  PokemonDB.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import RealmSwift

class PokemonDB: Object {
    @Persisted var abilities: List<AbilityDB>
    @Persisted var baseExperience: Int
    @Persisted var cries: CriesDB?
    @Persisted var forms: List<SpeciesDB>
    @Persisted var height: Int
    @Persisted(primaryKey: true) var id: Int
    @Persisted var isDefault: Bool
    @Persisted var locationAreaEncounters: String
    @Persisted var name: String
    @Persisted var order: Int
    @Persisted var species: SpeciesDB?
    @Persisted var weight: Int
}
