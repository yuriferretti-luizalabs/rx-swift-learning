//: Playground - noun: a place where people can play

import UIKit
import RxSwift

private let disposeBag = DisposeBag()

Observable.just("2")
    .subscribe(onNext: { value in
        print(value)
    })
    .disposed(by: disposeBag)

playgroundTimeLimit(seconds: 10)