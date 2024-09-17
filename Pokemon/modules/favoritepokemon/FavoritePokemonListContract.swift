//
//  FavoritePokemonListContract.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Combine

protocol FavoritePokemonListContract: ObservableObject {
    var uiState: FavoritePokemonListStates.UIState { get set }

    func onAppear()
}

enum FavoritePokemonListStates {
    enum UIState {
        case loading
        case empty
        case loaded([Pokemon])
        case error
    }
}
