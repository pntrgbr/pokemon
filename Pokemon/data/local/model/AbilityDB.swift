//
//  AbilityDB.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import RealmSwift

class AbilityDB: Object {
    @Persisted var ability: SpeciesDB?
    @Persisted var isHidden: Bool
    @Persisted var slot: Int
}
