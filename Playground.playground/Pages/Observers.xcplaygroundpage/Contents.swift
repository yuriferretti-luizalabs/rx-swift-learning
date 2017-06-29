//: [Anterior](@previous)

/*:
 ## Observers
 */

import Foundation
import RxSwift

//: Observer é qualquer objeto que reaje a um evento emitido por um Observable, normalmente são do tipo `ObservableType`
//: Para observar uma sequência temos que passar um `observer` como parâmetro do método `subscribe` ou usar `subscribe(onNext: onError: onCompleted: onDisposed:)`


//: Exemplo de classe que implementa ObserverType e é usada para printar os eventos no console
class PrintObserver<Element>: ObserverType {
    typealias E = Element
    
    func on(_ event: Event<Element>) {
        switch event {
        case let .next(element):
            print(element)
        case let .error(error):
            print("Error \(error)")
        case .completed:
            print("completed")
        }
    }
}

let sequence = Observable.from([1, 2, 3, 4, 5])
let observer = PrintObserver<Int>()

sequence.subscribe(observer)

addDelimiter()

sequence.subscribe(onNext: { (value) in
    print(value)
}, onError: { (error) in
    print("Error \(error)")
}, onCompleted: { 
    print("completed")
})

//: Ambas produzem a mesma saída no console
/*:
 ```
 1
 2
 3
 4
 5
 completed
 ```
 */


playgroundTimeLimit(seconds: 10)

//: [Próxima](@next)
