//
//  AppCoordinatorTests.swift
//  mikeTests
//
//  Created by Mihail on 14.09.2022.
//

import XCTest
@testable import mike

final class AppCoordinatorTests: XCTestCase {
    func test_init_defaultValues() throws {
        let coordinator = AppCoordinator()

        XCTAssertTrue(coordinator.rootViewController is MainController)
    }
}
