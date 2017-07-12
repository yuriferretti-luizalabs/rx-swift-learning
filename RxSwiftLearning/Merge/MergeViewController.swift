//
//  MergeViewController.swift
//  RxSwiftLearning
//
//  Created by Yuri Ferretti on 7/12/17.
//  Copyright © 2017 Yuri Ferretti. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MergeViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .stop,
            target: nil,
            action: nil
        )

        Observable.merge([
                navigationItem.leftBarButtonItem!.rx.tap.asObservable(),
                button.rx.tap.asObservable()
            ])
            .subscribe(onNext: {
                self.navigationController?.popViewController(animated: true)
            })
    }
}
