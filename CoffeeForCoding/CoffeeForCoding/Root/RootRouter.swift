//
//  RootRouter.swift
//  RibsTestApps
//
//  Created by linsaeng on 2020/06/07.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, SplashListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func replaceChildViewController(viewController: ViewControllable?)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    private let splashBuilder: SplashBuildable
    private var splashRouter: SplashRouting?
    
    init(
        interactor: RootInteractable,
        viewController: RootViewControllable,
        splashBuiler: SplashBuildable
    ) {
        self.splashBuilder = splashBuiler
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToSplash() {
        let router = self.splashBuilder.build(withListener: interactor)
        splashRouter = router
        self.attachChild(router)
        viewController.replaceChildViewController(viewController: router.viewControllable)
    }
}
