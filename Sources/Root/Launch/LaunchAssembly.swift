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

public final class ApplicationAssembly {

    public static func generalAssemble(container: Container) {
        QuickAccessManagerAssembly.assemble(container: container)
        AlertManagerAssembly.assemble(container: container)
        NetworkServicesAssembly.assemble(container: container)
    }
    
    public static func assembleUnauthorizedZone(container: Container) {
        AuthorizationUserStoryAssembly.assemble(container: container)
    }
    
    public static func assembleAuthorizedZone(container: Container) {
        AuthorizedZoneUserStoryAssembly.assemble(container: container)
    }
}
