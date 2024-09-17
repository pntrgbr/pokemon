//
//  Router.swift
//  Pokemon
//
//  Created by Gabor Pinter on 17/09/2024.
//

import SwiftUI

struct Router: View {
    @StateObject
    private var navigator = Navigator()

    var body: some View {
        NavigationStack(path: $navigator.path) {
            PokemonListScreen(viewModel: PokemonListViewModel())
                .navigationDestination(for: Navigator.Screen.self) { screen in
                    switch screen {
                    case .detail(let detail):
                        PokemonDetailScreen(viewModel: PokemonDetailViewModel(name: detail))
                    case .favorite:
                        FavoritePokemonListScreen(viewModel: FavoritePokemonListViewModel())
                    }
                }
        }
        .environmentObject(navigator)
    }
}
