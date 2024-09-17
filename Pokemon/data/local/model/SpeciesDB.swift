//
//  SpeciesDB.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import RealmSwift

class SpeciesDB: Object {
    @Persisted var name: String
    @Persisted var url: String
}
