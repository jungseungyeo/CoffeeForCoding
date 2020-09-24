//
//  SplashRouterMock.swift
//  CoffeeForCodingTests
//
//  Created by linsaeng on 2020/09/24.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RIBs
import Stubber
import RxSwift
import RxCocoa

@testable import CoffeeForCoding

class SplashRoutingMock: SplashRouting {
    
    var viewControllable: ViewControllable
    
    var interactable: Interactable {
        didSet { self.callSetInteractable() }
    }
    
    var children: [Routing] = [] {
        didSet { self.callSetChildren(children) }
    }
    
    var lifecycle: Observable<RouterLifecycle> {
        lifecycleSubject
    }
    
    var lifecycleSubject = PublishSubject<RouterLifecycle>() {
        didSet { self.callSetLifecyleSubject() }
    }
    
    init(interactable: SplashInteractable, viewControllable: ViewControllable) {
        self.interactable = interactable
        self.viewControllable = viewControllable
    }
    
    func callSetLifecyleSubject() {
        Stubber.invoke(callSetLifecyleSubject, args: ())
    }
    
    func callSetInteractable() {
        Stubber.invoke(callSetInteractable, args: ())
    }
    
    func callSetChildren(_ children: [Routing]) {
        Stubber.invoke(callSetChildren, args: (children))
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
