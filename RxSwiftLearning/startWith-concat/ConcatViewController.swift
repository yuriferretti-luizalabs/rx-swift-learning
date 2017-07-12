//
//  ConcatViewController.swift
//  RxSwiftLearning
//
//  Created by Yuri Ferretti on 7/12/17.
//  Copyright © 2017 Yuri Ferretti. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ConcatViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let colors: [UIColor] = [
            .red,
            .green,
            .blue
        ]

        let colors2: [UIColor] = [
            .yellow,
            .gray,
            .black
        ]

        let firstColors = PublishSubject<UIColor>()
        let secondColors = Observable<Any>.intervalColors(colors2)

            Observable.concat([firstColors, secondColors])
                .subscribe(onNext: { (color) in
                    self.colorView.backgroundColor = color
                })

        firstColors.onNext(.green)
        firstColors.onCompleted()

    }

}
