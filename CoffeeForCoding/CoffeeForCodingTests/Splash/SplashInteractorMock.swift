//
//  SplashInteractorMock.swift
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

class SplashInteractorMock: SplashInteractable {
    
    var isActive: Bool = false {
        didSet { self.callSetIsActive(isActive) }
    }
    
    var isActiveStream: Observable<Bool> {
        isActiveStreamSubject
    }
    
    var isActiveStreamSubject = PublishSubject<Bool>() {
        didSet { self.callSetIsActiveStreamSubject() }
    }
    
    var router: SplashRouting? {
        didSet { self.callSetRouter() }
    }
    
    var listener: SplashListener? {
        didSet { self.callSetListener() }
    }
    
    func activate() {
        Stubber.invoke(activate, args: ())
    }
    
    func deactivate() {
        Stubber.invoke(deactivate, args: ())
    }

    func callSetRouter() {
        Stubber.invoke(callSetRouter, args: ())
    }
    
    func callSetListener() {
        Stubber.invoke(callSetRouter, args: ())
    }
    
    func callSetIsActive(_ isActive: Bool) {
        Stubber.invoke(callSetIsActive, args: (isActive))
    }
    
    func callSetIsActiveStreamSubject() {
        Stubber.invoke(callSetIsActiveStreamSubject, args: ())
    }
    
}
