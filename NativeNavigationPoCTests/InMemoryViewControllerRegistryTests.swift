//
//  NativeNavigationPoCTests.swift
//  NativeNavigationPoCTests
//
//  Created by Nicolas Frugoni on 31/05/2022.
//

import XCTest
@testable import NativeNavigationPoC

class InMemoryViewControllerRegistryTests: XCTestCase {
    func test_registry_can_register_view_controllers() {
        let registry = InMemoryViewControllerRegistry()
        let viewController = UIViewController()
        registry.register(forKey: "key", viewController: { viewController })
        XCTAssertEqual(registry.viewController(forKey: "key"), viewController)
    }

    func test_invalid_key_returns_nil() {
        let registry = InMemoryViewControllerRegistry()
        XCTAssertNil(registry.viewController(forKey: "key"))
    }
}
