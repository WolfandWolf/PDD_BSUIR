//
//  ValidationPattern.swift
//  PDD
//
//  Created by Anton Rasoha on 11.05.21.
//

import Foundation

public protocol ValidationPattern {
    
    var pattern: String { get }
}

enum ValidationPatterns: String {
    case phoneAuthAnyFormat = "^\\+?\\d{3}( )?((\\(\\d{2}\\))|(\\d{2})){1}( )?\\d{3}( )?\\d{2}( )?\\d{2}$"
    case password = "^(.){8,64}$"
    case card = "^(\\d{4} ){3}(\\d{4})( )?(\\d{3})?$$"
    case card_clear = "^\\d{16,19}$"
    case all = "^.*$"
    case date = "^\\d{2}\\/\\d{2}$"
    case phone_formatted = "^0 \\(\\d{2}\\) \\d{3} \\d{2} \\d{2}$"
    case phone_clear = "^\\d{10}$"
    //case amount = "^\\d{0,16}([.][0-9]{0,2})?$"
    case amount = "^(((0)|([1-9]\\d{0,15}))([.][0-9]{0,2})?){0,1}$"
    //case decimal = "^\\d{0,16}([.][0-9]{0,8})?$"
    case decimal = "^(((0)|([1-9]\\d{0,15}))([.][0-9]{0,8})?){0,1}$"
    case numeric = "^\\d*$"
    case fio = "^((([A-Z]{1}([a-z]|[A-Z])*)(-(?:([A-Z]{1}([a-z]|[A-Z])*)))*)* ?){1,3}$"
    case profilePhoneNumber = "^\\+\\d{3} \\(\\d{2}\\) \\d{3} \\d{2} \\d{2}$"
    case numericCode = "^\\d+$"
    
    var regex: String { return self.rawValue }
}
