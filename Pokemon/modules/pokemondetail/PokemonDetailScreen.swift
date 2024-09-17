//
//  PokemonDetailScreen.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import SwiftUI
import Foundation

struct PokemonDetailScreen<ViewModel: PokemonDetailContract>: View {
    @StateObject
    var viewModel: ViewModel

    var body: some View {
        VStack {
            switch viewModel.uiState {
            case .loading:
                LoadingView()
            case .loaded(let pokemon, let favorite):
                PokemonDetailContent(pokemon: pokemon,
                                     favorite: favorite,
                                     imageURL: Utils.getUrl(id: pokemon.id),
                                     toogleFavorite: viewModel.toogleFavorite)
            case .error:
                ErrorComponent()
            }


            Spacer()
        }
        .onAppear { viewModel.onAppear() }
    }
}

extension PokemonDetailScreen {
    struct PokemonDetailContent: View {
        let pokemon: Pokemon
        let favorite: Bool
        let imageURL: URL?
        let toogleFavorite: () -> Void

        var body: some View {
            VStack {
                if let imageURL = imageURL {
                    ShareLink(item: imageURL) {
                        AsyncImage(url: imageURL)
                            .frame(width: imageSize, height: imageSize)
                    }
                }

                HStack {
                    Text(pokemon.name)
                        .font(.title)
                    Spacer()
                    Image(systemName: favorite ? favoritedImage : favoriteImage)
                        .foregroundColor(.red)
                        .onTapGesture { toogleFavorite() }
                }
                .padding()

                DetailContentElement(title: "height:",
                                     description: "\(pokemon.height)")
                DetailContentElement(title: "weight:",
                                     description: "\(pokemon.weight)")
                DetailContentElement(title: "order:",
                                     description: "\(pokemon.order)")
                DetailContentElement(title: "default:",
                                     description: "\(pokemon.isDefault)")
            }
        }
    }

    struct DetailContentElement: View {
        let title: String
        let description: String

        var body: some View {
            HStack {
                Text(title)
                    .font(.headline)
                Text(description)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 32)
        }
    }
}

private let imageSize: CGFloat = 50
private let favoritedImage = "heart.fill"
private let favoriteImage = "heart"
