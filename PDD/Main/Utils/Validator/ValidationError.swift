//
//  ValidationError.swift
//  PDD
//
//  Created by Anton Rasoha on 11.05.21.
//

import Foundation

public protocol ValidationError: Error {
    
    var message: String { get }
}

enum ValidationErrors: String, ValidationError {
    case emailInvalid = "validation_login_wrong_format"
    case internationalPhoneNumberInvalid = "validation_international_phone_format"
    case passwordInvalid = "validation_password"
    case cardNumberInvalid = "validation_card_number_length"
    case cardNameInvalid = "validation_card_name"
    case cardDataInvalid = "validation_exp_date_wrong_format"
    case cardDataExpInvalid = "validation_exp_date_expired"
    case phoneFormattedInvalid = "validation_inner_phone_format"
    case fioInvalid = "main_setting_account_fio_help"
    case profileEmailInvalid = "validation_email_wrong_format"
    case numericCodeInvalid = "validation_verification_code_wrong"
    
    var message: String { return self.rawValue }
}
