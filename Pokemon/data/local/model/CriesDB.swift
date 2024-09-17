//
//  CriesDB.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import RealmSwift

class CriesDB: Object {
    @Persisted var latest: String
    @Persisted var legacy: String
}
