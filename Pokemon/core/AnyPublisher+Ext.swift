//
//  AnyPublisher+Ext.swift
//  Pokemon
//
//  Created by Gabor Pinter on 16/09/2024.
//

import Combine

extension AnyPublisher {
    func sink(
        receiveValue: @escaping ((Self.Output) -> Void),
        receiveError: @escaping ((Error) -> Void)
    ) -> AnyCancellable {
        sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case let .failure(failure): receiveError(failure)
                }
            }, receiveValue: receiveValue
        )
    }
}
