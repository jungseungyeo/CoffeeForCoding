//
//  RootRouterMock.swift
//  CoffeeForCodingTests
//
//  Created by linsaeng on 2020/09/20.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import Stubber
import Quick
import Nimble
import RxSwift
import RIBs

@testable import CoffeeForCoding

class RootRoutingMock: RootRouting {
    
    var viewControllable: ViewControllable
    
    var interactable: Interactable {
        didSet { self.callSetInteractable() }
    }
    
    var children: [Routing] = [Routing]() {
        didSet { self.callSetChildren() }
    }
    
    var lifecycleSubject: PublishSubject<RouterLifecycle> = PublishSubject<RouterLifecycle>() {
        didSet { self.callSetLifecycleSubject() }
    }
    
    var lifecycle: Observable<RouterLifecycle> {
        return lifecycleSubject
    }
    
    init(
        interactor: RootInteractable,
        viewController: RootViewControllable,
        splashBuiler: SplashBuildable
    ) {
        self.interactable = interactor
        self.viewControllable = viewController
        
    }
    
    func callSetInteractable() {
        Stubber.invoke(callSetInteractable, args: ())
    }
    
    func callSetChildren() {
        Stubber.invoke(callSetChildren, args: ())
    }
    
    func callSetLifecycleSubject() {
        Stubber.invoke(callSetLifecycleSubject, args: ())
    }
    
    func routeToSplash() {
        Stubber.invoke(routeToSplash, args: ())
    }
    
    func load() {
        Stubber.invoke(load, args: ())
    }
    
    func attachChild(_ child: Routing) {
        Stubber.invoke(attachChild, args: (child))
    }
    
    func detachChild(_ child: Routing) {
        Stubber.invoke(detachChild, args: (child))
    }
}
