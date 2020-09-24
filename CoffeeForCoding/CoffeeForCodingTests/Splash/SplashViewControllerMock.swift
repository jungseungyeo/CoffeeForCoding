//
//  SplashViewController.swift
//  CoffeeForCodingTests
//
//  Created by linsaeng on 2020/09/24.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import Stubber
import UIKit

@testable import CoffeeForCoding

class SplashViewControllerMock: SplashViewControllable {
    
    var uiviewController: UIViewController = UIViewController() {
        didSet { self.callSetUiViewController(uiviewController) }
    }
    
    func callSetUiViewController(_ uiviewController: UIViewController) {
        Stubber.invoke(callSetUiViewController, args: (uiviewController))
    }
}
