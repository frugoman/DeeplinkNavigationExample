//
//  NativeNavigationPoCTests.swift
//  NativeNavigationPoCTests
//
//  Created by Nicolas Frugoni on 31/05/2022.
//

import XCTest
@testable import NativeNavigationPoC

class FlightViewControllerRegistratorTests: XCTestCase {
    func test_registers_all_view_controllers() {
        let registry = MockRegistry()
        let navigator = NoopScreenNavigator()
        let resolver = NoopViewControlllerResolver()
        let sut = FlightViewControllerRegistrator(registry: registry, navigator: navigator, resolver: resolver)
        sut.register()
        XCTAssertTrue(registry.contains(key: "FlightsList"))
        XCTAssertTrue(registry.contains(key: "FlightDetails"))
        XCTAssertEqual(registry.registeredViewControllers.count, 2)
    }
}

class NoopViewControlllerResolver: ViewControllerResolver {
    func resolve(forKey key: String) -> UIViewController {
        UIViewController()
    }
}

class NoopScreenNavigator: ScreenNavigator {
    func navigateBack() {
    }
    
    func navigate(toController controller: UIViewController) {
    }
}

class MockRegistry: ViewControllerRegistry {
    var registeredViewControllers: [String: UIViewController] = [:]
    
    func contains(key: String) -> Bool {
        registeredViewControllers.keys.contains(key)
    }
    
    func register(forKey key: String, viewController: @escaping () -> UIViewController) {
        registeredViewControllers[key] = viewController()
    }
    
    func viewController(forKey key: String) -> UIViewController? {
        registeredViewControllers[key]
    }
}
