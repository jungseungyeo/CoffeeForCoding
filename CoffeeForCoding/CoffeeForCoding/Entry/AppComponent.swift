//
//  AppComponent.swift
//  CoffeeForCoding
//
//  Created by linsaeng on 2020/09/20.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import Swinject
import RIBs

private let dependencyInjectionContainer = Container()

extension Component {
    var container: Container {
        dependencyInjectionContainer
    }
}

class AppComponent: Component<EmptyComponent>, RootDependency {
    init() {
        super.init(dependency: EmptyComponent())
    }
}

