//
//  PokemonRepository.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import Combine

protocol PokemonRepository {

    func updatePokemonlist() -> AnyCancellable

    func getPokemonList() -> AnyPublisher<[PokemonListEntry], Error>

    func getPokemon(for name: String) -> AnyPublisher<Pokemon?, Error>

    func updatePokemon(for name: String) -> AnyCancellable

    func isFavorite(for name: String) -> AnyPublisher<Bool, Error>

    func favoritePokemon(for name: String, favorite: Bool)

    func getFavoritedItems() -> AnyPublisher<[Pokemon], Error>
}
