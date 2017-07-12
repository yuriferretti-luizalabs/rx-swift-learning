//
//  MapViewController.swift
//  RxSwiftLearning
//
//  Created by Yuri Ferretti on 7/12/17.
//  Copyright © 2017 Yuri Ferretti. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MapViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.rx.text.orEmpty
            .map {
                $0.characters.count
            }
            .map { chars in
                "has \(chars)"
            }
            .bind(to: label.rx.text)
            
    }

}
