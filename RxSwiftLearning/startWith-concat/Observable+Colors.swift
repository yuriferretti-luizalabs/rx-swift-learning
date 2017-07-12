//
//  Observable+Colors.swift
//  RxSwiftLearning
//
//  Created by Yuri Ferretti on 7/12/17.
//  Copyright © 2017 Yuri Ferretti. All rights reserved.
//

import UIKit
import RxSwift

extension Observable {

    static func intervalColors(_ colors: [UIColor]) -> Observable<UIColor> {
        return Observable<Int>.interval(2, scheduler: MainScheduler.instance)
            .mapWithIndex { _, index in
                colors[index]
            }
            .take(colors.count)
    }
}
