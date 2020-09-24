//
//  RootViewControllerMock.swift
//  CoffeeForCodingTests
//
//  Created by linsaeng on 2020/09/22.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Stubber
import RIBs

@testable import CoffeeForCoding

class RootViewControllerMock: RootViewControllable {
    
    var uiviewController: UIViewController = UIViewController() {
        didSet { self.callSetUIViewController() }
    }
    
    func replaceChildViewController(viewController: ViewControllable?) {
        Stubber.invoke(replaceChildViewController, args: (viewController))
    }
    
    func callSetUIViewController() {
        Stubber.invoke(callSetUIViewController, args: ())
    }
}
