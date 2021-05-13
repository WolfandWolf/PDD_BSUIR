//
//  String+Localization.swift
//  PDD
//
//  Created by Anton Rasoha on 11.05.21.
//

import Foundation


extension String {
    
    var localized: String {
        return LocalizationSystem.sharedInstance.localizedStringForKey(key: self, comment: "\(self)")
    }
}
