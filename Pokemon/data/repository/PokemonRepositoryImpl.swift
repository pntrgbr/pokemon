//
//  PokemonRepositoryImpl.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import Moya
import Foundation
import Combine
import CombineMoya
import CombineSchedulers

struct PokemonRepositoryImpl: PokemonRepository {
    private let workScheduler: AnySchedulerOf<DispatchQueue>
    private let mainScheduler: AnySchedulerOf<DispatchQueue>
    private let pokemonApi: MoyaProvider<PokemonApi>
    private let pokemonDataSource: PokemonLocalDataSource
    private let pokemonListLocalDataSource: PokemonListLocalDataSource
    private let favoritePokemonLocalDataSource: FavoritePokemonLocalDataSource

    init(workScheduler: AnySchedulerOf<DispatchQueue>,
         mainScheduler: AnySchedulerOf<DispatchQueue>,
         pokemonApi: MoyaProvider<PokemonApi>,
         pokemonDataSource: PokemonLocalDataSource,
         pokemonListLocalDataSource: PokemonListLocalDataSource,
         favoritePokemonLocalDataSource: FavoritePokemonLocalDataSource) {
        self.workScheduler = workScheduler
        self.mainScheduler = mainScheduler
        self.pokemonApi = pokemonApi
        self.pokemonDataSource = pokemonDataSource
        self.pokemonListLocalDataSource = pokemonListLocalDataSource
        self.favoritePokemonLocalDataSource = favoritePokemonLocalDataSource
    }

    func updatePokemonlist() -> AnyCancellable {
        pokemonApi.requestPublisher(.list)
            .filterSuccessfulStatusCodes()
            .map([PokemonListEntryApi].self, atKeyPath: "results")
            .subscribe(on: workScheduler)
            .receive(on: mainScheduler)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { values in
                pokemonListLocalDataSource.update(listEntries: values.toDB())
            })
    }

    func getPokemonList() -> AnyPublisher<[PokemonListEntry], Error> {
        pokemonListLocalDataSource.getListEntries()
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    func getPokemon(for name: String) -> AnyPublisher<Pokemon?, Error> {
        pokemonDataSource.getPokemon(for: name)
            .map { $0?.toDomain() }
            .eraseToAnyPublisher()
    }

    func updatePokemon(for name: String) -> AnyCancellable {
        pokemonApi.requestPublisher(.detail(name: name))
            .filterSuccessfulStatusCodes()
            .map(PokemonApiModel.self)
            .subscribe(on: workScheduler)
            .receive(on: mainScheduler)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { pokemon in
                pokemonDataSource.update(pokemon: pokemon.toDB())
            })
    }

    func isFavorite(for name: String) -> AnyPublisher<Bool, any Error> {
        favoritePokemonLocalDataSource.isFavorite(for: name)
    }
    
    func favoritePokemon(for name: String, favorite: Bool) {
        favoritePokemonLocalDataSource.favorite(for: name,
                                                value: favorite)
    }

    func getFavoritedItems() -> AnyPublisher<[Pokemon], Error> {
        favoritePokemonLocalDataSource.getFavoritedItems()
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
