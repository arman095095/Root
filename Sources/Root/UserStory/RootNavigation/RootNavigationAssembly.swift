//
//  UnauthorizedNavigationAssembly.swift
//  diffibleData
//
//  Created by Арман Чархчян on 22.04.2022.
//  Copyright (c) 2022 Arman Davidoff. All rights reserved.
//

import Managers
import Swinject
import RootRouteMap

enum RootNavigationAssembly {
    static func makeModule(quickAccessManager: QuickAccessManagerProtocol, container: Container) -> RootNavigationModule {
        let view = RootNavigationController()
        let router = RootNavigationRouter()
        let interactor = RootNavigationInteractor()
        let presenter = RootNavigationPresenter(router: router,
                                                        interactor: interactor,
                                                        quickAccessManager: quickAccessManager,
                                                        container: container)
        view.output = presenter
        interactor.output = presenter
        presenter.view = view
        router.transitionHandler = view
        return RootNavigationModule(input: presenter, view: view) {
            presenter.output = $0
        }
    }
}
