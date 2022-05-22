//
//  UnauthorizedNavigationRouter.swift
//  diffibleData
//
//  Created by Арман Чархчян on 22.04.2022.
//  Copyright (c) 2022 Arman Davidoff. All rights reserved.
//

import UIKit
import AuthorizedZoneRouteMap
import Swinject
import AuthorizationRouteMap
import UserStoryFacade
import ModelInterfaces

protocol RootNavigationRouterInput: AnyObject {
    func openAuthorizationModule(output: AuthorizationModuleOutput,
                                 container: Container)
    func openAuthorizedZoneAfterLaunch(output: AuthorizedZoneModuleOutput,
                                       container: Container)
    func openAuthorizedZoneAfterAuthorization(account: AccountModelProtocol,
                                              output: AuthorizedZoneModuleOutput,
                                              container: Container)
}

final class RootNavigationRouter {
    weak var transitionHandler: UINavigationController?
}

extension RootNavigationRouter: RootNavigationRouterInput {

    func openAuthorizedZoneAfterAuthorization(account: AccountModelProtocol,
                                              output: AuthorizedZoneModuleOutput,
                                              container: Container) {
        let safeResolver = container.synchronize()
        guard let module = safeResolver.resolve(UserStoryFacadeProtocol.self)?.authorizedZone?.rootModuleAfterAuthorization(account: account) else {
            fatalError(ErrorMessage.dependency.localizedDescription)
        }
        module.output = output
        transitionHandler?.setViewControllers([module.view], animated: true)
    }
    
    func openAuthorizedZoneAfterLaunch(output: AuthorizedZoneModuleOutput,
                                       container: Container) {
        let safeResolver = container.synchronize()
        guard let module = safeResolver.resolve(UserStoryFacadeProtocol.self)?.authorizedZone?.rootModuleAfterLaunch() else {
            fatalError(ErrorMessage.dependency.localizedDescription)
        }
        module.output = output
        transitionHandler?.setViewControllers([module.view], animated: true)
    }
    
    func openAuthorizationModule(output: AuthorizationModuleOutput, container: Container) {
        let safeResolver = container.synchronize()
        guard let module = safeResolver.resolve(UserStoryFacadeProtocol.self)?.authorization?.rootModule() else {
            fatalError(ErrorMessage.dependency.localizedDescription)
        }
        module.output = output
        transitionHandler?.setViewControllers([module.view], animated: false)
    }
}
