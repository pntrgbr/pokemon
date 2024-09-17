//
//  UpdatePokemon.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Combine

protocol UpdatePokemon {
    func execute(for name: String) -> AnyCancellable
}

struct UpdatePokemonImpl: UpdatePokemon {
    private let repository: PokemonRepository

    init(repository: PokemonRepository) {
        self.repository = repository
    }

    func execute(for name: String) -> AnyCancellable {
        repository.updatePokemon(for: name)
    }
}
