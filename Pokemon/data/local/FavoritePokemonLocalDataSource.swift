//
//  FavoritePokemonLocalDataSource.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Combine
import RealmSwift

protocol FavoritePokemonLocalDataSource {

    func isFavorite(for name: String) -> AnyPublisher<Bool, Error>

    func favorite(for name: String, value: Bool)

    func getFavoritedItems() -> AnyPublisher<[PokemonDB], Error>
}

struct FavoritePokemonLocalDataSourceImpl: FavoritePokemonLocalDataSource {
    private let realm: Realm

    init(realm: Realm) {
        self.realm = realm
    }

    func isFavorite(for name: String) -> AnyPublisher<Bool, Error> {
        RealmResultsPublisher(results: realm.objects(FavoritePokemonDB.self))
            .map { $0.first(where: { $0.name == name })?.favorited ?? false }
            .eraseToAnyPublisher()
    }

    func favorite(for name: String, value: Bool) {
        let favorite = FavoritePokemonDB()
        favorite.name = name
        favorite.favorited = value

        try! realm.write {
            realm.add(favorite, update: .modified)
        }
    }

    func getFavoritedItems() -> AnyPublisher<[PokemonDB], Error> {
        RealmResultsPublisher(results: realm.objects(FavoritePokemonDB.self))
            .combineLatest(
                RealmResultsPublisher(results: realm.objects(PokemonDB.self))
                    .eraseToAnyPublisher()
            ) { favorite, pokemons in
                let favoritedIds = favorite
                    .filter { $0.favorited }
                    .map(\.name)
                return pokemons.filter { favoritedIds.contains($0.name) }
            }
            .eraseToAnyPublisher()
    }
}
