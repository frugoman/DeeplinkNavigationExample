//
//  NativeNavigationPoCTests.swift
//  NativeNavigationPoCTests
//
//  Created by Nicolas Frugoni on 31/05/2022.
//

import XCTest
@testable import NativeNavigationPoC

class FlightsViewControllerTests: XCTestCase {
    
    func test_button_tapped_navigates_to_flight_details() {
        let navigator = MockScreenNavigator()
        let resolver = MockViewControllerResolver()
        let sut = FlightsViewController()
        sut.navigator = navigator
        sut.resolver = resolver
        sut.buttonTapped()
        XCTAssertTrue(navigator.navigated)
        XCTAssertFalse(navigator.navigatedBack)
        XCTAssertEqual(resolver.calledForKey, "FlightDetails")
    }
}

class MockScreenNavigator: ScreenNavigator {
    var navigated = false
    var navigatedBack = false
    
    func navigate(toController controller: UIViewController) {
        navigated = true
    }
    
    func navigateBack() {
        navigatedBack = true
    }
}

class MockViewControllerResolver: ViewControllerResolver {
    var calledForKey: String?
    func resolve(forKey key: String) throws -> UIViewController {
        calledForKey = key
        return UIViewController()
    }
}
