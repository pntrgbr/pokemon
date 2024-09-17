//
//  GetFavoritedPokemons.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Combine

protocol GetFavoritedPokemons {
    func execute() -> AnyPublisher<[Pokemon], Error>
}

struct GetFavoritedPokemonsImpl: GetFavoritedPokemons {
    private let repository: PokemonRepository

    init(repository: PokemonRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[Pokemon], Error> {
        repository.getFavoritedItems()
    }
}
