//
//  RootBuilder.swift
//  RibsTestApps
//
//  Created by linsaeng on 2020/06/07.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RIBs

protocol RootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class RootComponent: Component<RootDependency> {
    let rootViewController: RootViewController
    
    init(dependency: RootDependency, rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
}

extension RootComponent: SplashDependency { }

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {
    
    func build() -> LaunchRouting {
        let viewController = RootViewController()
        let component = RootComponent(dependency: self.dependency, rootViewController: viewController)
        let interactor = RootInteractor(presenter: viewController)

        let splashbuilder = SplashBuilder(dependency: component)
        
        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          splashBuiler: splashbuilder)
    }

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }
}
