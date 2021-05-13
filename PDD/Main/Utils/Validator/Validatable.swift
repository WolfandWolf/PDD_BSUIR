//
//  Validatable.swift
//  PDD
//
//  Created by Anton Rasoha on 11.05.21.
//

import Foundation

public protocol Validatable {
    
    func validate<Rule: ValidationRule>(rule: Rule) -> ValidationResult where Rule.InputType == Self
    
    func validate(rules: ValidationRuleSet<Self>) -> ValidationResult
}

extension Validatable {
    
    public func validate<R: ValidationRule>(rule: R) -> ValidationResult where R.InputType == Self {
        
        return Validator.validate(input: self, rule: rule)
    }
    
    public func validate(rules: ValidationRuleSet<Self>) -> ValidationResult {
        
        return Validator.validate(input: self, rules: rules)
    }
}

extension String : Validatable {
}

extension Int : Validatable {
}

extension Double : Validatable {
}

extension Float : Validatable {
}

extension Array : Validatable {
}

extension Date : Validatable {
}

public enum ValidationResult {
    
    case valid
    
    case invalid([ValidationError])
    
    public var isValid: Bool {
        
        return self == .valid
    }
}

extension ValidationResult: Equatable {
    
    public static func == (lhs: ValidationResult, rhs: ValidationResult) -> Bool {
        
        switch (lhs, rhs) {
            
            case (.valid, .valid):
                return true
                
            case (.invalid(let a), .invalid(let b)):
                return a.map({ $0.message }).joined() == b.map({ $0.message }).joined()
                
            default:
                return false
        }
    }
}
