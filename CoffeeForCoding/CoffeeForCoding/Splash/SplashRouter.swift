//
//  SplashRouter.swift
//  CoffeeForCoding
//
//  Created by linsaeng on 2020/09/22.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RIBs

protocol SplashInteractable: Interactable {
    var router: SplashRouting? { get set }
    var listener: SplashListener? { get set }
}

protocol SplashViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SplashRouter: ViewableRouter<SplashInteractable, SplashViewControllable>, SplashRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SplashInteractable, viewController: SplashViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
