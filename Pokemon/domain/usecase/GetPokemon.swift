//
//  GetPokemon.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Combine

protocol GetPokemon {
    func execute(for name: String) -> AnyPublisher<Pokemon?, Error>
}

struct GetPokemonImpl: GetPokemon {
    private let repository: PokemonRepository

    init(repository: PokemonRepository) {
        self.repository = repository
    }

    func execute(for name: String) -> AnyPublisher<Pokemon?, Error> {
        repository.getPokemon(for: name)
    }
}
