//: Playground - noun: a place where people can play

import UIKit
import RxSwift

enum E: Error {
    case foo
}

let publishSubject = ReplaySubject<String>.create(bufferSize: 2)
publishSubject.onNext("1")
publishSubject.onNext("2")
publishSubject.onNext("3")

var variable: Variable? = Variable<String>("initial")

//variable?.asObservable()
//    .debug("publish", trimOutput: true)
//    .subscribe(onNext: { (value) in
//    print(value)
//}, onError: { (error) in
//    print("Error")
//}, onCompleted: { 
//    print("completed")
//})

variable?.value = "second"
variable?.value = "third"
variable = nil

publishSubject.onCompleted()
publishSubject.onNext("4")

struct S {
    let a: Int
}

Observable.from([S(a: 1), S(a:1)])
    .distinctUntilChanged({ (old, new) -> Bool in
        old.a == new.a
    })
    .subscribe { (value) in
        print(value)
    }

playgroundTimeLimit(seconds: 10)



