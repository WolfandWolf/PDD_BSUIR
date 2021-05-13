//
//  LoginViewController.swift
//  PDD
//
//  Created by Anton Rasoha on 10.05.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit
import SkyFloatingLabelTextField
import Presentr


class LoginViewController: UIViewController {
    
    @IBOutlet weak var userField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordField: SkyFloatingLabelTextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var sigInButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var switchLanguageButton: RoundedButton!
    
    lazy var presenter: Presentr = {
        let width = ModalSize.default
        let height = ModalSize.default
        let center = ModalCenterPosition.center
        let customType = PresentationType.custom(width: width, height: height, center: center)
        
        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .crossDissolve
        customPresenter.dismissTransitionType = .crossDissolve
        customPresenter.roundCorners = false
        customPresenter.cornerRadius = 5.0
        customPresenter.backgroundColor = .black
        customPresenter.backgroundOpacity = 0.5
        customPresenter.dismissOnSwipe = true
        customPresenter.dismissOnSwipeDirection = .top
        return customPresenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        passwordField.titleFormatter = { (text: String) -> String in
            return text
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @IBAction func textFieldEditingChanged(_ sender: SkyFloatingLabelTextField) {
        guard let text = sender.text, text.count > 0 else {
            sender.errorMessage = nil
            //errorMessage.text = ""
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var backName = ""
        switch segue.identifier {
            case "password":
                backName = "common_sign_in"
            case "forgot":
                backName = "label_restore_password"
            case "register":
                backName = "label_registration"
            default:
                backName = "ups"
        }
        navigationItem.backBarButtonItem = UIBarButtonItem(title: backName.localized, style: .plain, target: nil, action: nil)
    }
    
    private func validateLogin(data: String?) -> Bool {
        guard let text = data, text.count > 0 else {
            userField.errorMessage = "validation_login_cannot_be_empty".localized
            return false
        }
        
        let emailRule = ValidationRulePattern(pattern: EmailValidationPattern.standard, error: ValidationErrors.emailInvalid)
        let phoneRule = ValidationRulePattern(pattern: ValidationPatterns.phoneAuthAnyFormat.regex, error: ValidationErrors.internationalPhoneNumberInvalid)
        var rules = ValidationRuleSet<String>()
        rules.add(rule: emailRule)
        rules.add(rule: phoneRule)
        let result = text.validate(rules: rules)
        switch result {
            case .valid:
                return true
            case .invalid(let failures):
                switch failures.count {
                    case 2:
                        userField.errorMessage = "validation_login_wrong_format".localized
                    case 0, 1:
                        userField.errorMessage = nil
                        //errorMessage.text = ""
                        return true
                    default:
                        userField.errorMessage = "validation_login_wrong_format".localized
                }
        }
        return false
    }
    
    private func validatePassword(data: String?) -> Bool {
        guard let text = data, text.count > 0 else {
            passwordField.errorMessage = "validation_password_cannot_be_empty".localized
            return false
        }
        
        let passwordRule = ValidationRulePattern(pattern: ValidationPatterns.password.regex, error: ValidationErrors.passwordInvalid)
        let result = text.validate(rule: passwordRule)
        switch result {
            case .valid:
                return true
            case .invalid(let failures):
                passwordField.errorMessage = failures[0].message.localized
                return false
        }
    }
    
    @IBAction func selectLanguage(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let gbrAction = UIAlertAction(title: "lang_eng".localized, style: .default) { (action:UIAlertAction) in
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            self.restartRootController()
        }
        
        let rusAction = UIAlertAction(title: "lang_rus".localized, style: .default) { (action:UIAlertAction) in
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "ru")
            self.restartRootController()
        }
        
        let cancelAction = UIAlertAction(title: "common_cancel".localized, style: .cancel)
        
        optionMenu.addAction(gbrAction)
        optionMenu.addAction(rusAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    private func restartRootController() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: .main)
        let navVC = storyboard.instantiateViewController(withIdentifier: "navigationBegin") as! UINavigationController
        let appDlg = UIApplication.shared.delegate as? SceneDelegate
        appDlg?.window?.rootViewController = navVC
        appDlg?.window?.makeKeyAndVisible()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
            case 0:
                let _ = validateLogin(data: textField.text)
                passwordField.becomeFirstResponder()
            case 1:
                let _ = validatePassword(data: textField.text)
                passwordField.resignFirstResponder()
            default:
                print("undefined text field")
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        userField.errorMessage = nil
        // errorMessage.text = ""
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
            case 0:
                let _ = validateLogin(data: textField.text)
            case 1:
                let _ = validatePassword(data: textField.text)
            default:
                print("undefined text field")
        }
    }
}
