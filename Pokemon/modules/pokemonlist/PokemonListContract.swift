//
//  PokemonListContract.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import Combine

protocol PokemonListContract: ObservableObject {
    var uiState: PokemonListStates.UIState { get set }

    func onAppear()
}

enum PokemonListStates {
    enum UIState {
        case loading
        case loaded([PokemonListEntry])
        case error
    }
}
