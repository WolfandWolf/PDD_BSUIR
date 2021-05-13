//
//  regInteractor.swift
//  PDD
//
//  Created by Anton Rasoha on 13.05.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol regBusinessLogic {
    func doSomething(request: reg.Something.Request)
}

protocol regDataStore {
    //var name: String { get set }
}

class regInteractor: regBusinessLogic, regDataStore {
    
    var presenter: regPresentationLogic?
    var worker: regWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: reg.Something.Request) {
        worker = regWorker()
        worker?.doSomeWork()
        
        let response = reg.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
