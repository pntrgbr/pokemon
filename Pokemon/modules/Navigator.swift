//
//  Navigator.swift
//  Pokemon
//
//  Created by Gabor Pinter on 17/09/2024.
//

import Combine
import SwiftUI

@MainActor
final class Navigator: ObservableObject {
    enum Screen: Hashable {
        case detail(String)
        case favorite
    }

    @Published var path: NavigationPath = .init()

    func push(_ screen: Screen) {
        path.append(screen)
    }
}
