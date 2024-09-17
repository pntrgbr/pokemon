//
//  GetPokemonList.swift
//  Pokemon
//
//  Created by Gabor Pinter on 13/09/2024.
//

import Combine

protocol GetPokemonList {
    func execute() -> AnyPublisher<[PokemonListEntry], Error>
}

struct GetPokemonListImpl: GetPokemonList {
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[PokemonListEntry], Error> {
        repository.getPokemonList()
    }
}
