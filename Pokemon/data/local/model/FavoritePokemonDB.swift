//
//  FavoritePokemonDB.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import RealmSwift

class FavoritePokemonDB: Object {
    @Persisted(primaryKey: true) var name: String
    @Persisted var favorited: Bool
}
