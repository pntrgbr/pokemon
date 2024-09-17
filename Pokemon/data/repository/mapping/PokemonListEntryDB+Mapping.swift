//
//  PokemonListEntryDB+Mapping.swift
//  Pokemon
//
//  Created by Gabor Pinter on 13/09/2024.
//

extension PokemonListEntryDB: DomainType {
    func toDomain() -> PokemonListEntry {
        .init(name: name)
    }
}

extension PokemonListEntryApi: DBType {
    func toDB() -> PokemonListEntryDB {
        .build { object in
            object.name = name
        }
    }
}
