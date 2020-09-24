//
//  RootBuilderMock.swift
//  CoffeeForCodingTests
//
//  Created by linsaeng on 2020/09/22.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RIBs
import Stubber

@testable import CoffeeForCoding

class RootBuilderMock: RootBuildable {
    func build() -> LaunchRouting {
        return Stubber.invoke(build, args: ())
    }
}
