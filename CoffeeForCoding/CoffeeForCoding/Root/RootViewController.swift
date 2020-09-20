//
//  RootViewController.swift
//  RibsTestApps
//
//  Created by linsaeng on 2020/06/07.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {
    
    private var targetViewController: ViewControllable?
    private var animationInProgress = false
    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    private func add(_ targetChildViewController: UIViewController) {
        self.addChild(targetChildViewController)
        self.view.addSubview(targetChildViewController.view)
        self.view.addConstraints(targetChildViewController.view.constraints)
        targetChildViewController.didMove(toParent: self)
    }
    
    private func remove(_ targetChildViewController: UIViewController) {
        self.willMove(toParent: nil)
        targetChildViewController.view.removeFromSuperview()
        targetChildViewController.removeFromParent()
    }
    
    func replaceChildViewController(viewController: ViewControllable?) {
        let oldViewController = self.targetViewController?.uiviewController
        defer {
            if let oldViewController = oldViewController {
                self.remove(oldViewController)
            }
        }
        self.targetViewController = viewController
        if let viewController = viewController?.uiviewController {
            self.add(viewController)
        }
    }
}
