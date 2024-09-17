//
//  PokemonListEntryDB.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import RealmSwift

class PokemonListEntryDB: Object {
    @Persisted(primaryKey: true) var name: String
}
