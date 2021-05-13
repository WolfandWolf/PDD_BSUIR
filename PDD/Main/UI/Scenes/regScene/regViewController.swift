//
//  regViewController.swift
//  PDD
//
//  Created by Anton Rasoha on 13.05.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

protocol regDisplayLogic: class {
    func displaySomething(viewModel: reg.Something.ViewModel)
}

class regViewController: UIViewController, regDisplayLogic {
    
    //@IBOutlet private var nameTextField: UITextField!
    
    var interactor: regBusinessLogic?
    var router: (NSObjectProtocol & regRoutingLogic & regDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        regConfigurator.shared.configure(with: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        regConfigurator.shared.configure(with: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: Do something
    
    func doSomething() {
        let request = reg.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: reg.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
