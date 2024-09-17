//
//  DI+UseCase.swift
//  Pokemon
//
//  Created by Gabor Pinter on 13/09/2024.
//

import Factory
import Moya
import RealmSwift

extension Container {
    var realm: Factory<Realm> {
        Factory(self) {
            try! Realm(configuration: .init(deleteRealmIfMigrationNeeded: true))
        }
    }

    var pokemonRepository: Factory<PokemonRepository> {
        Factory(self) {
            PokemonRepositoryImpl(workScheduler: Container.workScheduler,
                                  mainScheduler: Container.mainScheduler,
                                  pokemonApi: MoyaProvider<PokemonApi>(),
                                  pokemonDataSource: self.pokemonDataSource(),
                                  pokemonListLocalDataSource: self.pokemonListDataSource(),
                                  favoritePokemonLocalDataSource: self.favoritePokemonLocalDataSource())
        }
    }

    var pokemonDataSource: Factory<PokemonLocalDataSource> {
        Factory(self) { PokemonLocalDataSourceImpl(realm: self.realm()) }
    }

    var pokemonListDataSource: Factory<PokemonListLocalDataSource> {
        Factory(self) { PokemonListLocalDataSourceImpl(realm: self.realm()) }
    }

    var favoritePokemonLocalDataSource: Factory<FavoritePokemonLocalDataSource> {
        Factory(self) { FavoritePokemonLocalDataSourceImpl(realm: self.realm()) }
    }
}
