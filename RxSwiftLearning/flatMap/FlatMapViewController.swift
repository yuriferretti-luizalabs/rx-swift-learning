//
//  FlatMapViewController.swift
//  RxSwiftLearning
//
//  Created by Yuri Ferretti on 7/12/17.
//  Copyright © 2017 Yuri Ferretti. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FlatMapViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.rx.text.orEmpty
            .flatMap { text in
                API.searchResult(for: text)
            }
            .bind(to: label.rx.text)
            
    }

}
