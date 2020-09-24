//
//  RootRouterSpec.swift
//  CoffeeForCodingTests
//
//  Created by linsaeng on 2020/09/22.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RIBs
import Stubber
import Quick
import Nimble
import RxSwift

@testable import CoffeeForCoding

final class RootRouterSpec: QuickSpec {
    
    override func spec() {
        super.spec()
        
        var splashBuilder: SplashBuilderMock!
        var interactor: RootInteractorMock!
        var router: RootRouter!
        
        beforeEach {
            interactor = RootInteractorMock()
            splashBuilder = SplashBuilderMock()
            
            Stubber.register(interactor.callSetRouter) { }
            Stubber.register(interactor.callSetListner) { }
            
            let viewController = RootViewControllerMock()
            
            Stubber.register(viewController.callSetUIViewController) { }
            Stubber.register(viewController.replaceChildViewController) { _ in }
            
            router = RootRouter(
                interactor: interactor,
                viewController: viewController,
                splashBuiler: splashBuilder
            )
        }
        
        describe("when called routeToSplash") {
            it("attach tasks RIBs") {
                
                let splashInteractor = SplashInteractorMock()
                
                Stubber.register(splashInteractor.callSetRouter) { }
                Stubber.register(splashInteractor.callSetListener) { }
                Stubber.register(splashInteractor.callSetIsActive) { _ in }
                Stubber.register(splashInteractor.activate) { }
                Stubber.register(splashInteractor.deactivate) { }
                
                let splashViewController = SplashViewControllerMock()
                
                let splashRouter = SplashRoutingMock(
                    interactable: splashInteractor,
                    viewControllable: splashViewController
                )
                
                Stubber.register(splashRouter.load) { }
                
                var assignedListener: SplashListener?
                
                Stubber.register(splashBuilder.build) { listener in
                    assignedListener = listener
                    return splashRouter
                }
                
                expect(assignedListener).to(beNil())
                expect(Stubber.executions(splashBuilder.build).count) == 0
                expect(Stubber.executions(splashRouter.load).count) == 0
                
                router.routeToSplash()
                
                expect(Stubber.executions(splashBuilder.build).count) == 1
                expect(Stubber.executions(splashRouter.load).count) == 1
            }
        }
    }
}
