//
//  UpdateFavorite.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Combine

protocol UpdateFavorite {
    func execute(with name: String, favorite: Bool)
}

struct UpdateFavoriteImpl: UpdateFavorite {
    private let repository: PokemonRepository

    init(repository: PokemonRepository) {
        self.repository = repository
    }

    func execute(with name: String, favorite: Bool) {
        repository.favoritePokemon(for: name, favorite: favorite)
    }
}
