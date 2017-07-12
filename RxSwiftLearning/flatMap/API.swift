//
//  API.swift
//  RxSwiftLearning
//
//  Created by Yuri Ferretti on 7/12/17.
//  Copyright © 2017 Yuri Ferretti. All rights reserved.
//

import Foundation
import RxSwift

let scheduler = ConcurrentDispatchQueueScheduler(qos: .utility)

class API {

    static func searchResult(for term: String) -> Observable<String> {
        let isEven = term.characters.count % 2 == 0
        let delay = isEven ? 0.5 : 1
        return Observable.just("Results for \(term)").delay(delay, scheduler: scheduler)
    }
}
