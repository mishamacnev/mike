//
//  Coordinator.swift
//  mike
//
//  Created by Mihail on 14.09.2022.
//

import UIKit

class Coordinator: NSObject {
    var childCoordinators = [Coordinator]()

    private(set) var rootViewController: UIViewController?

    var willFinish: ((Coordinator) -> ())?

    /// Notify parent coordinator that this subflow has finished
    var didFinish: ((Coordinator) -> ())?

    func start() {}
}


// MARK: - Helper Methods
extension Coordinator {

    func pushCoordinator(_ coordinator: Coordinator) {
        coordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
        }

        coordinator.start()
        childCoordinators.append(coordinator)
    }

    func popCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }

}

extension Coordinator: UINavigationControllerDelegate {
    // MARK: - For notifying child coordinators

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {}

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {}
}


extension Coordinator {
    enum RouteType {
        case present
        case push
    }
}
