//
//  regPresenter.swift
//  PDD
//
//  Created by Anton Rasoha on 13.05.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

protocol regPresentationLogic {
    func presentSomething(response: reg.Something.Response)
}

class regPresenter: regPresentationLogic {
    
    weak var viewController: regDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: reg.Something.Response) {
        let viewModel = reg.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
