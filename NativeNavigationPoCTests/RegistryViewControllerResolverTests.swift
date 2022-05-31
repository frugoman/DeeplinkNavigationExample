//
//  NativeNavigationPoCTests.swift
//  NativeNavigationPoCTests
//
//  Created by Nicolas Frugoni on 31/05/2022.
//

import XCTest
@testable import NativeNavigationPoC

class RegistryViewControllerResolverTests: XCTestCase {
    func test_resolver_can_resolve_view_controllers() throws {
        let registry = MockRegistry()
        let viewController = UIViewController()
        registry.register(forKey: "key", viewController: { viewController })
        let resolver = RegistryViewControllerResolver(registry: registry)
        XCTAssertEqual(try resolver.resolve(forKey: "key"), viewController)
    }
    
    func test_invalid_key_returns_nil() throws {
        let registry = MockRegistry()
        let resolver = RegistryViewControllerResolver(registry: registry)
        XCTAssertThrowsError(try resolver.resolve(forKey: "key"))
    }
}
