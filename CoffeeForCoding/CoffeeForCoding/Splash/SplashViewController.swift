//
//  SplashViewController.swift
//  CoffeeForCoding
//
//  Created by linsaeng on 2020/09/22.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol SplashPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SplashViewController: UIViewController, SplashPresentable, SplashViewControllable {

    weak var listener: SplashPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
