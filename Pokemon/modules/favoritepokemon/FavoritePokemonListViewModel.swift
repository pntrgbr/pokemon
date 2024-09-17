//
//  FavoritePokemonListViewModel.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Combine
import Factory

final class FavoritePokemonListViewModel: FavoritePokemonListContract {
    @Published
    var uiState: FavoritePokemonListStates.UIState = .loading

    @LazyInjected(\.getFavoritedPokemons)
    private var getFavoritedPokemons

    private var bag = Set<AnyCancellable>()

    func onAppear() {
        getFavoritedPokemons.execute()
            .sink { [weak self] pokemons in
                if pokemons.isEmpty {
                    self?.uiState = .empty
                } else {
                    self?.uiState = .loaded(pokemons)
                }
            } receiveError: { [weak self] _ in
                self?.uiState = .error
            }
            .store(in: &bag)
    }
}
