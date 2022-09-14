//
//  SceneDelegateTests.swift
//  mikeTests
//
//  Created by Mihail on 14.09.2022.
//

import XCTest
@testable import mike

final class SceneDelegateTests: XCTestCase {
    func test_configureWindow_setsWindowAsKeyAndVisible() {
        let window = UIWindow()
        let sut = SceneDelegate()
        sut.window = window
        sut.configureWindow()

        XCTAssertFalse(window.isHidden, "Expected window to be visible")
    }

    func test_configureWindow_configuresRootViewController() {
        let sut = SceneDelegate()
        sut.window = UIWindow()
        sut.configureWindow()

        let root = sut.window?.rootViewController
        let controller = root as? MainController

        XCTAssertNotNil(controller)
    }
}
