//: [Anterior](@previous)

/*:
 ## Observers
 */

import Foundation
import RxSwift

//: Subjects são entidades que podem se comportar como Observable e Observer, ou seja, podem emitir e receber eventos. Diferem entre sí pela forma com que emitem eventos para seus Observers

//: #### PublishSubject
//: Envia para os Observers apenas o que é emitido após o `subscribe`
 

let publishSubject = PublishSubject<String>()
publishSubject.onNext("I'll be ignored")

publishSubject.subscribe(onNext: { (value) in
    print(value)
})

publishSubject.onNext("I'll be printed")
publishSubject.onNext("and me too")

//: Irá imprimir
/*:
 ```
 I'll be printed
 and me too
 ```
 */
addDelimiter()

//: #### BehaviorSubject
//: Envia para os Observers o último evento emitido no momento em que acontece o `subscribe`, por isso precisa que um valor inicial seja passado na inicialização do objeto

let behaviorSubject = BehaviorSubject<String>(value: "I''l be ignored")
behaviorSubject.onNext("But I'll be printed")

behaviorSubject.subscribe(onNext: { (value) in
    print(value)
})

behaviorSubject.onNext("and me too")
//: Irá imprimir
/*:
 ```
 I'll be printed
 and me too
 ```
 */
addDelimiter()


//: #### ReplaySubject
//: Envia para os Observers no momento do `subscribe` as `N` emissões que forem armazenadas no buffer, ou o que estiver no buffer caso o número de emissões seja menor que `N`
 

let replaySubject = ReplaySubject<String>.create(bufferSize: 2)
replaySubject.onNext("I'm waiting")
replaySubject.onNext("I'm on buffer")
replaySubject.onNext("But I'll be printed")

replaySubject.subscribe(onNext: { (value) in
    print(value)
})

replaySubject.onNext("and me too")
//: Irá imprimir
/*:
 ```
 I'm on buffer
 But I'll be printed
 and me too
 ```
 */
addDelimiter()

//: #### Variable
//: Funciona como um BehaviorSubject mas não emite erros nem completa até ser desalocada. Para emitir um evento um elemento tem que ser atribuido usando a propriedade `value` da `Variable`

let variable = Variable<String>("Initial value")


variable.asObservable().subscribe(onNext: { (value) in
    print(value)
})

variable.value = "second value"
//: Irá imprimir
/*:
 ```
 Initial value
 second value
 ```
 */
addDelimiter()


//: #### Sequências não emitem mais nada após um evento de erro ou completed

let errorSubject = PublishSubject<String>()

errorSubject.subscribe(onNext: { (value) in
    print(value)
})

errorSubject.onNext("event 1")
errorSubject.onNext("event 2")
errorSubject.onCompleted()
errorSubject.onNext("event 3")

//: Irá imprimir
/*:
 ```
 event 1
 event 2
 ```
 */


//: [Próxima](@next)
