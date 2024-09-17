//
//  GetFavorite.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Combine

protocol GetFavorite {
    func execute(name: String) -> AnyPublisher<Bool, Error>
}

struct GetFavoriteImpl: GetFavorite {
    private let repository: PokemonRepository

    init(repository: PokemonRepository) {
        self.repository = repository
    }

    func execute(name: String) -> AnyPublisher<Bool, Error> {
        repository.isFavorite(for: name)
    }
}
