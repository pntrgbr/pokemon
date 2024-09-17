//
//  PokemonDetailViewModel.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Combine
import Factory
import Foundation

final class PokemonDetailViewModel: PokemonDetailContract {
    private let pokemonName: String

    @Published
    var uiState: PokemonDetailStates.UIState = .loading

    @LazyInjected(\.getPokemon)
    private var getPokemon

    @LazyInjected(\.updatePokemon)
    private var updatePokemon

    @LazyInjected(\.getFavorite)
    private var getFavorite

    @LazyInjected(\.updateFavorite)
    private var updateFavorite

    private var bag = Set<AnyCancellable>()

    init(name: String) {
        pokemonName = name
    }

    func onAppear() {
        getPokemon.execute(for: pokemonName)
            .combineLatest(getFavorite.execute(name: pokemonName))
            .eraseToAnyPublisher()
            .sink { [weak self] (pokemon, favorited) in
                if let pokemon = pokemon {
                    self?.uiState = .loaded(pokemon, favorited)
                }
            } receiveError: { [weak self] _ in
                self?.uiState = .error
            }
            .store(in: &bag)

        updatePokemon.execute(for: pokemonName)
            .store(in: &bag)
    }

    func toogleFavorite() {
        if case let .loaded(_, favorited) = uiState {
            updateFavorite.execute(with: pokemonName,
                                   favorite: !favorited)
        }
    }
}
