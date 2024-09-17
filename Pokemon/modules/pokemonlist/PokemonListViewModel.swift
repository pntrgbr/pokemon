//
//  PokemonListViewModel.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import Combine
import Factory

final class PokemonListViewModel: PokemonListContract {
    @Published
    var uiState: PokemonListStates.UIState = .loading

    @LazyInjected(\.getPokemonList)
    private var getPokemonList

    @LazyInjected(\.updatePokemonList)
    private var updatePokemonList

    private var bag = Set<AnyCancellable>()

    func onAppear() {
        getPokemonList.execute()
            .sink { [weak self] values in
                self?.uiState = .loaded(values)
            } receiveError: { [weak self] error in
                self?.uiState = .error
            }
            .store(in: &bag)

        updatePokemonList.execute()
            .store(in: &bag)
    }
}
