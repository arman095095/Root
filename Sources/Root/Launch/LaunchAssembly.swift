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
import Firebase
import Authorization
import AlertManager
import Utils
import UIKit
import NetworkServices
import FirebaseAuth
import Account
import AuthorizedZone

public final class ApplicationAssembly: Assembly {
    public func assemble(container: Container) {
        UtilsAssembly().assemble(container: container)
        KeychainServiceAssembly().assemble(container: container)
        UserDefaultsServiceAssembly().assemble(container: container)
        QuickAccessManagerAssembly().assemble(container: container)
        AlertManagerAssembly().assemble(container: container)
        NetworkServicesAssembly().assemble(container: container)
        AuthManagerAssembly().assemble(container: container)
        CoreDataServiceAssembly().assemble(container: container)
        AccountCacheServiceAssembly().assemble(container: container)
        AccountManagerAssembly().assemble(container: container)
        ProfilesManagerAssembly().assemble(container: container)
        AuthorizationUserStoryAssembly().assemble(container: container)
        SettingsUserStoryAssembly().assemble(container: container)
        ProfileUserStoryAssembly().assemble(container: container)
        AuthorizedZoneUserStoryAssembly().assemble(container: container)
    }
}
