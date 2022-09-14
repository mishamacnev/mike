//
//  AppCoordinator.swift
//  mike
//
//  Created by Mihail on 14.09.2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    private let viewConroller = MainController()

    override var rootViewController: UIViewController? {
        viewConroller
    }
}
