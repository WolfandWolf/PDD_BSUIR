//
//  RoundedButton.swift
//  PDD
//
//  Created by Anton Rasoha on 11.05.21.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    
    // MARK: - overriden system methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpButton()
    }
    
    // MARK: - private methods
    private func setUpButton() {
        self.roundedView()
    }
}
