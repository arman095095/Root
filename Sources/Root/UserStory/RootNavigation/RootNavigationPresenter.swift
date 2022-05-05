//
//  UnauthorizedNavigationPresenter.swift
//  diffibleData
//
//  Created by Арман Чархчян on 22.04.2022.
//  Copyright (c) 2022 Arman Davidoff. All rights reserved.
//

import Managers
import ModelInterfaces
import Swinject
import RootRouteMap
import AuthorizationRouteMap
import AuthorizedZoneRouteMap

protocol RootNavigationViewOutput: AnyObject {
    func viewDidLoad()
}

final class RootNavigationPresenter {
    
    weak var view: RootNavigationViewInput?
    weak var output: RootNavigationModuleOutput?
    private let router: RootNavigationRouterInput
    private let interactor: RootNavigationInteractorInput
    private let quickAccessManager: QuickAccessManagerProtocol
    private let container: Container
    
    init(router: RootNavigationRouterInput,
         interactor: RootNavigationInteractorInput,
         quickAccessManager: QuickAccessManagerProtocol,
         container: Container) {
        self.router = router
        self.interactor = interactor
        self.quickAccessManager = quickAccessManager
        self.container = container
    }
}

extension RootNavigationPresenter: RootNavigationViewOutput {
    func viewDidLoad() {
        view?.setupInititalState()
        configure()
    }
}

private extension RootNavigationPresenter {
    func configure() {
        guard let _ = quickAccessManager.userID else {
            router.openAuthorizationModule(output: self, container: container)
            return
        }
        router.openAuthorizedZoneAfterLaunch(output: self, container: container)
    }
}

extension RootNavigationPresenter: RootNavigationInteractorOutput {
    
}

extension RootNavigationPresenter: RootNavigationModuleInput {
    
}

extension RootNavigationPresenter: AuthorizationModuleOutput {
    func userAuthorized(account: AccountModelProtocol) {
        router.openAuthorizedZoneAfterAuthorization(account: account, output: self, container: container)
    }
}


extension RootNavigationPresenter: AuthorizedZoneModuleOutput {
    func openAuthorization() {
        router.openAuthorizationModule(output: self, container: container)
    }
}
