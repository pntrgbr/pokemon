//
//  UpdatePokemonList.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Combine

protocol UpdatePokemonList {
    func execute() -> AnyCancellable
}

struct UpdatePokemonListImpl: UpdatePokemonList {
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }

    func execute() -> AnyCancellable {
        repository.updatePokemonlist()
    }
}
