//
//  PokemonLocalDataSource.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import Combine
import RealmSwift

protocol PokemonLocalDataSource {

    func getPokemon(for name: String) -> AnyPublisher<PokemonDB?, Error>

    func update(pokemon: PokemonDB)
}

struct PokemonLocalDataSourceImpl: PokemonLocalDataSource {
    private let realm: Realm

    init(realm: Realm) {
        self.realm = realm
    }

    func getPokemon(for name: String) -> AnyPublisher<PokemonDB?, Error> {
        RealmResultsPublisher(results: realm.objects(PokemonDB.self))
            .map { $0.first(where: { $0.name == name }) }
            .eraseToAnyPublisher()
    }

    func update(pokemon: PokemonDB) {
        try! realm.write {
            realm.add(pokemon, update: .modified)
        }
    }
}
