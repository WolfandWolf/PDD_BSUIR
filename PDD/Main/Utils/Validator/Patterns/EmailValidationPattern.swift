//
//  EmailValidationPattern.swift
//  PDD
//
//  Created by Anton Rasoha on 11.05.21.
//

import Foundation

public enum EmailValidationPattern: ValidationPattern {
    
    case simple
    case standard
    
    public var pattern: String {
        switch self {
            case .simple: return "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$"  // "^.+@.+\\..+$" //return "^.+@.+\\..+$"
            case .standard: return "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$"
        }
    }
}
