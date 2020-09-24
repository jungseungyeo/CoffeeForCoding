//
//  RootInteractorMock.swift
//  CoffeeForCodingTests
//
//  Created by linsaeng on 2020/09/22.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RxSwift
import RxCocoa
import Stubber

@testable import CoffeeForCoding

class RootInteractorMock: RootInteractable {
    var router: RootRouting? {
        didSet { self.callSetRouter() }
    }
    
    var listener: RootListener? {
        didSet { self.callSetListner() }
    }
    
    func activate() {
        Stubber.invoke(activate, args: ())
    }
    
    func deactivate() {
        Stubber.invoke(deactivate, args: ())
    }
    
    var isActive: Bool = false {
        didSet { self.callSetActive(self.isActive) }
    }
    
    var isActiveStream: Observable<Bool> {
        isActiveStreamSubject
    }
    
    func callSetRouter() {
        Stubber.invoke(callSetRouter, args: ())
    }
    
    func callSetListner() {
        Stubber.invoke(callSetListner, args: ())
    }
    
    func callSetActive(_ isActivete: Bool) {
        Stubber.invoke(callSetActive, args: (isActive))
    }
    
    var isActiveStreamSubject: PublishSubject<Bool> = PublishSubject<Bool>() {
        didSet { self.callSetActiveStreamSubject() }
    }
    
    func callSetActiveStreamSubject() {
        Stubber.invoke(callSetActiveStreamSubject, args: ())
    }

}
