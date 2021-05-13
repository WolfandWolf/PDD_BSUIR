//
//  LoginConfigurator.swift
//  PDD
//
//  Created by Anton Rasoha on 10.05.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class LoginConfigurator {
    static let shared = LoginConfigurator()
    
    func configure (with vc: LoginViewController) {
        let viewController = vc
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
