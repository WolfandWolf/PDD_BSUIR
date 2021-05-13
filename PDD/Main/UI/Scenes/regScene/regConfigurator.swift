//
//  regConfigurator.swift
//  PDD
//
//  Created by Anton Rasoha on 13.05.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class regConfigurator {
    static let shared = regConfigurator()
    
    func configure (with vc: regViewController) {
        let viewController = vc
        let interactor = regInteractor()
        let presenter = regPresenter()
        let router = regRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
