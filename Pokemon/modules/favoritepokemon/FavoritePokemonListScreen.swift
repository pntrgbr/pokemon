//
//  FavoritePokemonListScreen.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import SwiftUI

struct FavoritePokemonListScreen<ViewModel: FavoritePokemonListContract>: View {
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
            case .empty:
                NoFavoriteItems()
            case .error:
                ErrorComponent()
            }

            Spacer()
        }
        .onAppear { viewModel.onAppear() }
    }
}

extension FavoritePokemonListScreen {
    struct ListComponent: View {
        let pokemons: [Pokemon]
        let onSelect: (String) -> Void

        var body: some View {
            List(pokemons, id: \.name) { pokemon in
                HStack {
                    Text(pokemon.name)
                    Spacer()
                    AsyncImage(url: Utils.getUrl(id: pokemon.id))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    onSelect(pokemon.name)
                }
            }
        }
    }

    struct NoFavoriteItems: View {
        var body: some View {
            VStack {
                Image(systemName: noFavoriteItemImage)
                    .padding()

                Text(noFavoriteTitle)
                    .font(.headline)
            }
            .frame(height: 100)
        }
    }
}

private let noFavoriteItemImage = "heart.slash"
private let noFavoriteTitle = "You have no favourite items"
