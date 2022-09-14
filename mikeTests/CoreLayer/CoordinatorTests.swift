//
//  CoordinatorTests.swift
//  mikeTests
//
//  Created by Mihail on 14.09.2022.
//

import XCTest
@testable import mike

final class CoordinatorTests: XCTestCase {

    override func setUp() {
        super.setUp()

        TestData.childCoordinatorMock.reset()
    }

    func test_init_defaultValues() throws {
        let coordinator = makeSUT()

        XCTAssertTrue(coordinator.childCoordinators.isEmpty)
        XCTAssertNil(coordinator.rootViewController)
        XCTAssertNil(coordinator.willFinish)
        XCTAssertNil(coordinator.didFinish)
    }

    func test_pushCoordinator_shouldStartFlow() throws {
        let coordinator = makeSUT()

        coordinator.pushCoordinator(TestData.childCoordinatorMock)

        XCTAssertEqual(coordinator.childCoordinators, [TestData.childCoordinatorMock])
        XCTAssertEqual(TestData.childCoordinatorMock.startWasCalled, 1)
    }

    func test_pushCoordinator_callPopCoordinatorOnDidFinish() throws {
        let coordinator = makeSUT()

        coordinator.pushCoordinator(TestData.childCoordinatorMock)
        TestData.childCoordinatorMock.didFinish?(TestData.childCoordinatorMock)

        XCTAssertTrue(coordinator.childCoordinators.isEmpty)
    }
}

private extension CoordinatorTests {
    enum TestData {
        static let childCoordinatorMock = CoordinatorMock()
    }

    func makeSUT() -> Coordinator {
        Coordinator()
    }
}

private class CoordinatorMock: Coordinator {
    var startWasCalled: Int = 0

    override func start() {
        startWasCalled += 1
    }

    func reset() {
        startWasCalled = 0
    }
}
