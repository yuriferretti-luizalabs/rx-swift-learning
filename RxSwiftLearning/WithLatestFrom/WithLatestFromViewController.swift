//
//  WithLatestFromViewController.swift
//  RxSwiftLearning
//
//  Created by Yuri Ferretti on 7/12/17.
//  Copyright © 2017 Yuri Ferretti. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WithLatestFromViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let ints = Observable<Int>.interval(0.5, scheduler: MainScheduler.instance)

        button.rx.tap.asObservable()
            .withLatestFrom(ints)
            .map { "\($0)" }
            .bind(to: label.rx.text)
    }
}
