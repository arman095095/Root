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
import SettingsRouteMap
import AccountRouteMap
import ModelInterfaces
import ProfileRouteMap
import AuthorizationRouteMap
import UserStoryFacade

protocol RootNavigationRouterInput: AnyObject {
    func openAuthorizationModule(output: AuthorizationModuleOutput,
                                 container: Container)
    func openAuthorizedZoneAfterLaunch(output: AuthorizedZoneModuleOutput,
                                       container: Container)
    func openAuthorizedZoneAfterAuthorization(account: AccountModelProtocol,
                                              output: AuthorizedZoneModuleOutput,
                                              container: Container)
    func openAccountCreationModule(output: AccountModuleOutput,
                                   container: Container)
    func openAccountEditModule(output: AccountModuleOutput,
                               container: Container)
    func openProfileModule(profile: ProfileModelProtocol,
                           container: Container,
                           output: ProfileModuleOutput)
}

final class RootNavigationRouter {
    weak var transitionHandler: UINavigationController?
}

extension RootNavigationRouter: RootNavigationRouterInput {

    func openAuthorizedZoneAfterAuthorization(account: AccountModelProtocol,
                                              output: AuthorizedZoneModuleOutput,
                                              container: Container) {
        let safeResolver = container.synchronize()
        guard let module = safeResolver.resolve(UserStoryFacade.self)?.authorizedZoneUserStory?.rootModuleAfterAuthorization(account: account) else {
            fatalError(ErrorMessage.dependency.localizedDescription)
        }
        module.output = output
        transitionHandler?.setViewControllers([module.view], animated: true)
    }
    
    func openAuthorizedZoneAfterLaunch(output: AuthorizedZoneModuleOutput,
                                       container: Container) {
        let safeResolver = container.synchronize()
        guard let module = safeResolver.resolve(UserStoryFacade.self)?.authorizedZoneUserStory?.rootModuleAfterLaunch() else {
            fatalError(ErrorMessage.dependency.localizedDescription)
        }
        module.output = output
        transitionHandler?.setViewControllers([module.view], animated: true)
    }
    
    func openAuthorizationModule(output: AuthorizationModuleOutput, container: Container) {
        let safeResolver = container.synchronize()
        guard let module = safeResolver.resolve(UserStoryFacade.self)?.authorizationUserStory?.rootModule() else {
            fatalError(ErrorMessage.dependency.localizedDescription)
        }
        module.output = output
        transitionHandler?.setViewControllers([module.view], animated: false)
    }
    
    func openAccountCreationModule(output: AccountModuleOutput, container: Container) {
        let safeResolver = container.synchronize()
        guard let module = safeResolver.resolve(UserStoryFacade.self)?.accountUserStory?.createAccountModule() else {
            fatalError(ErrorMessage.dependency.localizedDescription)
        }
        module.output = output
        transitionHandler?.pushViewController(module.view, animated: true)
    }
    
    func openAccountEditModule(output: AccountModuleOutput, container: Container) {
        let safeResolver = container.synchronize()
        guard let module = safeResolver.resolve(UserStoryFacade.self)?.accountUserStory?.editAccountModule() else {
            fatalError(ErrorMessage.dependency.localizedDescription)
        }
        module.output = output
        transitionHandler?.pushViewController(module.view, animated: true)
    }
    
    func openProfileModule(profile: ProfileModelProtocol, container: Container, output: ProfileModuleOutput) {
        let safeResolver = container.synchronize()
        guard let module = safeResolver.resolve(UserStoryFacade.self)?.profileUserStory?.friendAccountModule(profile: profile) else {
            fatalError(ErrorMessage.dependency.localizedDescription)
        }
        module.output = output
        transitionHandler?.pushViewController(module.view, animated: true)
    }
}
