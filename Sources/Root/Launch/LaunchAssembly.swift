//
//  DependenciesAssembly.swift
//  diffibleData
//
//  Created by Арман Чархчян on 22.04.2022.
//  Copyright © 2022 Arman Davidoff. All rights reserved.
//

import Foundation
import Swinject
import Managers
import AlertManager
import Utils
import UIKit
import NetworkServices

public final class ApplicationAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        UtilsAssembly().assemble(container: container)
        NetworkServicesAssembly().assemble(container: container)
        AlertManagerAssembly().assemble(container: container)
        ManagersAssembly().assemble(container: container)
        UserStoryAssembly().assemble(container: container)
    }
}
