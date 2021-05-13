//
//  UIView+Extension.swift
//  PDD
//
//  Created by Anton Rasoha on 11.05.21.
//

import Foundation
import UIKit

extension UIView {
    // circle view
    func roundedView() {
        self.layer.cornerRadius = self.frame.size.height / 2.0;
        self.clipsToBounds = true;
    }
}
