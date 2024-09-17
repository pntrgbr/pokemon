//
//  PokemonDetailContract.swift
//  Pokemon
//
//  Created by Gabor Pinter on 11/09/2024.
//

import Foundation
import Combine

protocol PokemonDetailContract: ObservableObject {
    var uiState: PokemonDetailStates.UIState { get set }

    func onAppear()

    func toogleFavorite()
}

enum PokemonDetailStates {
    enum UIState {
        case loading
        case loaded(Pokemon, Bool)
        case error
    }
}
