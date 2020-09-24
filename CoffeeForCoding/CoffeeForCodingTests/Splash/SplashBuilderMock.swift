//
//  SplashBuilderMock.swift
//  CoffeeForCodingTests
//
//  Created by linsaeng on 2020/09/24.
//  Copyright © 2020 linsaeng. All rights reserved.
//

import RxSwift
import RIBs
import RxCocoa
import Stubber

@testable import CoffeeForCoding

class SplashBuilderMock: SplashBuildable {
    
    func build(withListener listener: SplashListener) -> SplashRouting {
        Stubber.invoke(build, args: (listener))
    }
}
