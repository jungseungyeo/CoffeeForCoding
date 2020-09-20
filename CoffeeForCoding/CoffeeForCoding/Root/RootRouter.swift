//
//  RootRouter.swift
//  RibsTestApps
//
//  Created by linsaeng on 2020/06/07.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func replaceChildViewController(viewController: ViewControllable?)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    override init(interactor: RootInteractable, viewController: RootViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToSplash() {
        
    }
    
//    func routeToMains() {
//        let mains = mainBuilder.build(withListener: interactor)
//        self.mains = mains
//        self.attachChild(mains)
//        viewController.replaceChildViewController(viewController: mains.viewControllable)
//    }
}
