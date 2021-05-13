//
//  LoginInteractor.swift
//  PDD
//
//  Created by Anton Rasoha on 10.05.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func doSomething(request: Login.Something.Request)
}

protocol LoginDataStore {
    //var name: String { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: Login.Something.Request) {
        worker = LoginWorker()
        worker?.doSomeWork()
        
        let response = Login.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
