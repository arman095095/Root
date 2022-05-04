//
//  UnauthorizedNavigationViewController.swift
//  diffibleData
//
//  Created by Арман Чархчян on 22.04.2022.
//  Copyright (c) 2022 Arman Davidoff. All rights reserved.
//

import UIKit

protocol RootNavigationViewInput: AnyObject {
    func setupInititalState()
}

final class RootNavigationController: UINavigationController {
    var output: RootNavigationViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
    
}

extension RootNavigationController: RootNavigationViewInput {
    func setupInititalState() {
        navigationBar.prefersLargeTitles = false
    }
}
