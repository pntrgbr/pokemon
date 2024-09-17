//
//  PokemonListScreen.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import SwiftUI

struct PokemonListScreen<ViewModel: PokemonListContract>: View {
    @StateObject
    var viewModel: ViewModel

    @EnvironmentObject
    private var navigator: Navigator

    var body: some View {
        VStack {
            switch viewModel.uiState {
            case .loading:
                LoadingView()
            case .loaded(let pokemons):
                ListComponent(pokemons: pokemons, 
                              onSelect: { navigator.push(.detail($0) )})
            case .error:
                ErrorComponent()
            }

            Spacer()
        }
        .navigationTitle(title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    navigator.push(.favorite)
                }, label: {
                    Image(systemName: favoriteImage)
                })
            }
        }
        .onAppear { viewModel.onAppear() }
    }
}

extension PokemonListScreen {
    struct ListComponent: View {
        let pokemons: [PokemonListEntry]
        let onSelect: (String) -> Void

        var body: some View {
            List(pokemons, id: \.name) { pokemon in
                HStack {
                    Text(pokemon.name)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    onSelect(pokemon.name)
                }
            }
        }
    }
}

private let title = "Pokemons"
private let favoriteImage = "heart"
