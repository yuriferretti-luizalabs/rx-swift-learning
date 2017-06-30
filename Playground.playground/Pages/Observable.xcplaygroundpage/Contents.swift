

import Foundation
import RxSwift

/*:
 ## Creating Observables
 */

//: ##### A partir de uma lista de elementos
//: Cada item da lista será uma emissão next(Elemento)
let obs1 = Observable.of(1, 2, 3, 4, 5)
obs1.subscribe(onNext: { (value) in
    print(value)
})
addDelimiter()
/*:
 ```
 1
 2
 3
 4
 5
 ```
 */

//: ##### Apartir de uma sequência -> Sequence
//: Cada item da sequência será uma emissão next(Elemento)
let obs2 = Observable.from([1, 2, 3, 4, 5])
obs2.subscribe(onNext: { (value) in
    print(value)
})
addDelimiter()
/*:
 ```
 1
 2
 3
 4
 5
 ```
 */

//: ##### A partir de um único elemento
//: Apenas o elemento passado como parâmetro do método .just() será emitido
let obs3 = Observable.just(1)
obs3.subscribe(onNext: { (value) in
    print(value)
})
addDelimiter()
/*:
 ```
 1
 ```
 */

//: ##### Observable é um tipo genérico
//: Pode emitir qualquer tipo válido em Swift

struct MyType {
    let property: Int
}

let obs4 = Observable.just(MyType(property: 10))
obs4.subscribe(onNext: { (value) in
    print(value)
})
addDelimiter()
/*:
 ```
 MyType(property: 10)
 ```
 */

//: Incusive arrays e outras estruturas de dados
let array = ["Hello", "RxSwift"]
let obs5 = Observable.just(array)
.subscribe(onNext: { (value) in
    print(value)
})
addDelimiter()
/*:
 ```
 ["Hello", "RxSwift"]
 ```
 */

playgroundTimeLimit(seconds: 10)

//: [Próxima](@next)
