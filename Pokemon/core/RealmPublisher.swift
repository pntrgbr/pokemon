//
//  RealmPublisher.swift
//  Pokemon
//
//  Created by Gabor Pinter on 15/09/2024.
//

import Combine
import RealmSwift

struct RealmResultsPublisher<Element: Object>: Publisher {
    typealias Output = [Element]
    typealias Failure = Error

    private let results: Results<Element>

    init(results: Results<Element>) {
        self.results = results
    }

    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        let subscription = RealmResultsSubscription(subscriber: subscriber, results: results)
        subscriber.receive(subscription: subscription)
    }
}

class RealmResultsSubscription<S: Subscriber, Element: Object>: Subscription where S.Input == [Element],
                                                                                   S.Failure == Error {
    private var subscriber: S?
    private var token: NotificationToken?

    init(subscriber: S, results: Results<Element>) {
        self.subscriber = subscriber

        token = results.observe { [weak self] changes in
            switch changes {
            case .initial(let initialResults):
                _ = self?.subscriber?.receive(Array(initialResults))
            case .update(let updatedResults, _, _, _):
                _ = self?.subscriber?.receive(Array(updatedResults))
            case .error(let error):
                self?.subscriber?.receive(completion: .failure(error))
            }
        }
    }

    func request(_ demand: Subscribers.Demand) { }

    func cancel() {
        token?.invalidate()
        subscriber = nil
    }
}
