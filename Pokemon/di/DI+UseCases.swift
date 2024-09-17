//
//  DI+UseCases.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Foundation
import Factory
import CombineSchedulers

extension Container {
    static let workScheduler: AnySchedulerOf<DispatchQueue> =
        DispatchQueue.global(qos: .userInteractive).eraseToAnyScheduler()
    static let mainScheduler: AnySchedulerOf<DispatchQueue> =
        DispatchQueue.main.eraseToAnyScheduler()

    var getPokemonList: Factory<GetPokemonList> {
        Factory(self) {
            GetPokemonListImpl(repository: self.pokemonRepository()) }
    }

    var updatePokemonList: Factory<UpdatePokemonList> {
        Factory(self) {
            UpdatePokemonListImpl(repository: self.pokemonRepository())
        }
    }

    var getPokemon: Factory<GetPokemon> {
        Factory(self) {
            GetPokemonImpl(repository: self.pokemonRepository())
        }
    }

    var updatePokemon: Factory<UpdatePokemon> {
        Factory(self) {
            UpdatePokemonImpl(repository: self.pokemonRepository())
        }
    }

    var getFavorite: Factory<GetFavorite> {
        Factory(self) {
            GetFavoriteImpl(repository: self.pokemonRepository())
        }
    }

    var updateFavorite: Factory<UpdateFavorite> {
        Factory(self) {
            UpdateFavoriteImpl(repository: self.pokemonRepository())
        }
    }

    var getFavoritedPokemons: Factory<GetFavoritedPokemons> {
        Factory(self) {
            GetFavoritedPokemonsImpl(repository: self.pokemonRepository())
        }
    }
}
