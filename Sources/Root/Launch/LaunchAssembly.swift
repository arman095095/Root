//
//  DependenciesAssembly.swift
//  diffibleData
//
//  Created by Арман Чархчян on 22.04.2022.
//  Copyright © 2022 Arman Davidoff. All rights reserved.
//

import Swinject
import Managers
import AlertManager
import Utils
import NetworkServices
import Services

public final class ApplicationAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        NetworkServicesAssembly().assemble(container: container)
        AlertManagerAssembly().assemble(container: container)
        ServicesAssembly().assemble(container: container)
        ManagersAssembly().assemble(container: container)
        UserStoryAssembly().assemble(container: container)
    }
}
