//
//  MainControllerTests.swift
//  mikeTests
//
//  Created by Mihail on 14.09.2022.
//

import XCTest
@testable import mike

final class MainControllerTests: XCTestCase {
    func test_view_backgroundColor() throws {
        let controller = MainController()

        controller.loadViewIfNeeded()

        XCTAssertEqual(controller.view.backgroundColor, .purple)
    }
}
