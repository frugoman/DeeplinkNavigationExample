//
//  NativeNavigationPoCTests.swift
//  NativeNavigationPoCTests
//
//  Created by Nicolas Frugoni on 31/05/2022.
//

import XCTest
@testable import NativeNavigationPoC

class ViewControllerRegistratorComposerTest: XCTestCase {
    func test_registers_all_view_controllers() {
        let registry = MockRegistry()
        let navigator = NoopScreenNavigator()
        let composer = ViewControllerRegistratorComposer(registry: registry, navigator: navigator, resolver: NoopViewControlllerResolver())
        composer.register()
        XCTAssertEqual(registry.registeredViewControllers.count, 3)
    }
}
