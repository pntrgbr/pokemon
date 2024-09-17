//
//  PokemonListLocalDataSource.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import Combine
import RealmSwift

protocol PokemonListLocalDataSource {

    func getListEntries() -> AnyPublisher<[PokemonListEntryDB], Error>

    func update(listEntries: [PokemonListEntryDB])
}

struct PokemonListLocalDataSourceImpl: PokemonListLocalDataSource {
    private let realm: Realm

    init(realm: Realm) {
        self.realm = realm
    }

    func getListEntries() -> AnyPublisher<[PokemonListEntryDB], Error> {
        RealmResultsPublisher(results: realm.objects(PokemonListEntryDB.self))
            .eraseToAnyPublisher()
    }

    func update(listEntries: [PokemonListEntryDB]) {
        try! realm.write {
            let objects = realm.objects(PokemonListEntryDB.self)
            realm.delete(objects)
            realm.add(listEntries, update: .modified)
        }
    }
}
