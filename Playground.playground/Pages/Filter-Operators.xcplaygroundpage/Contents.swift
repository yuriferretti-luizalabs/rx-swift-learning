//: [Previous](@previous)

import Foundation
import RxSwift

/*:
 ## Operadores de filtro/seleção
 */

//: Operadores que controlam qual eventos serão emitidos pela sequência

//: ### filter
//: Não emite os elementos que não satisfaçam uma determinada condição

let obs1 = Observable.from([1, 2, 3, 4, 5])
obs1.filter { $0 > 2 }
    .subscribe(onNext: { (value) in
        print(value)
    })
addDelimiter()
//: Irá imprimir
/*:
 ```
 3
 4
 5
 ```
 */

//: ### skip
//: Ignora os primeiros `N` elementos da sequência

let obs2 = Observable.from([1, 2, 3, 4, 5])
obs2.skip(3)
    .subscribe(onNext: { (value) in
        print(value)
    })
addDelimiter()
//: Irá imprimir
/*:
 ```
 4
 5
 ```
 */

//: ### skipWhile
//: Ignora os elementos da sequência enquanto a condição não for satisfeita. A partir do momento que a condição for satisfeita a primeira vez os elementos da sequência começarão a ser emitidos

let obs3 = Observable.from([1, 2, 3, 4, 5])
obs3.skipWhile { $0 != 3 }
    .subscribe(onNext: { (value) in
        print(value)
    })
addDelimiter()
//: Irá imprimir
/*:
 ```
 3
 4
 5
 ```
 */

//: ### skipWhileWithIndex
//: Ignora os elementos da sequência enquanto a condição não for satisfeita. A partir do momento que a condição for satisfeita a primeira vez os elementos da sequência começarão a ser emitidos. Essa variante do método expõe o índice do elemento emitido para que ele possa ser usado na condição
let obs4 = Observable.from([1, 2, 3, 4, 5])
obs3.skipWhileWithIndex({ (element, index) -> Bool in
        index < 3
    })
    .subscribe(onNext: { (value) in
        print(value)
    })
addDelimiter()
//: Irá imprimir
/*:
 ```
 4
 5
 ```
 */

//: ### take
//: Emite apenas os `N` primeiros elementos da sequência

let obs5 = Observable.from([1, 2, 3, 4, 5])
obs5.take(3)
    .subscribe(onNext: { (value) in
        print(value)
    })
addDelimiter()
//: Irá imprimir
/*:
 ```
 1
 2
 3
 ```
 */

//: ### takeLast
//: Emite apenas os `N` últimos elementos da sequência

let obs6 = Observable.from([1, 2, 3, 4, 5])
obs6.takeLast(3)
    .subscribe(onNext: { (value) in
        print(value)
    })
addDelimiter()
//: Irá imprimir
/*:
 ```
 3
 4
 5
 ```
 */

//: ### takeWhile
//: Emite os elementos da sequência enquanto a condição não for satisfeita.

let obs7 = Observable.from([1, 2, 3, 4, 5])
obs7.takeWhile { $0 != 3 }
    .subscribe(onNext: { (value) in
        print(value)
    })
addDelimiter()
//: Irá imprimir
/*:
 ```
 3
 4
 5
 ```
 */

//: ### takeWhileWithIndex
//: Emite os elementos da sequência enquanto a condição não for satisfeita. Essa variante do método expõe o índice do elemento emitido para que ele possa ser usado na condição

let obs8 = Observable.from([1, 2, 3, 4, 5])
obs8.takeWhile { $0 != 3 }
    .subscribe(onNext: { (value) in
        print(value)
    })
addDelimiter()
//: Irá imprimir
/*:
 ```
 3
 4
 5
 ```
 */


//: ### distinctUntilChanged
//: Ignora o elemento da sequência que seja igual ao elemento emitido anteriormente
let obs9 = Observable.from([1, 2, 2, 3, 4, 4, 5])
obs9.distinctUntilChanged()
    .subscribe(onNext: { (value) in
        print(value)
    })
addDelimiter()
//: Irá imprimir
/*:
 ```
 1
 2
 3
 4
 5
 ```
 */

//: Exemplo com closure
struct MyType {
    let foo: Int
}

let obs10 = Observable.from([MyType(foo: 1), MyType(foo: 2), MyType(foo: 2), MyType(foo: 3)])
obs10.distinctUntilChanged { old, new in
        old.foo == new.foo
    }
    .subscribe(onNext: { (value) in
        print(value)
    })
addDelimiter()
//: Irá imprimir
/*:
 ```
 MyType(foo: 1)
 MyType(foo: 2)
 MyType(foo: 3)
 ```
 */

playgroundTimeLimit(seconds: 10)


//: [Next](@next)
