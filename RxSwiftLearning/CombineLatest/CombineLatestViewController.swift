//
//  CombineLatestViewController.swift
//  RxSwiftLearning
//
//  Created by Yuri Ferretti on 7/12/17.
//  Copyright © 2017 Yuri Ferretti. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CombineLatestViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let emailIsValid = emailTextField.rx.text.orEmpty
            .map { text in
                text.contains("@")
            }
            .shareReplay(1)

        let passwordIsValid = passwordTextField.rx.text.orEmpty
            .map { pass in
                pass.characters.count >= 6
            }

        emailIsValid.bind(to: passwordTextField.rx.isEnabled)

        Observable.combineLatest(emailIsValid, passwordIsValid) { isEmailValid, isPasswordValid in
            return isEmailValid && isPasswordValid
        }
        .bind(to: button.rx.isEnabled)
    }
}
