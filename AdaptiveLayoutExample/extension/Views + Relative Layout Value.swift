//
//  UIStackView + RelativeLayout.swift
//  AdaptiveLayoutExample
//
//  Created by 신승현 on 2020/11/03.
//

import Foundation
import UIKit

extension UIStackView {
    
    open override func awakeFromNib() {
        if self.axis == .horizontal {
            self.spacing = self.spacing.relativeToIphone8Width()
        } else {
            self.spacing = self.spacing.relativeToIphone8Height()
        }
        self.layoutIfNeeded()
    }
    
}

extension UILabel {
    
    open override func awakeFromNib() {
        self.font = self.font.withSize(self.font.pointSize.relativeToIphone8Width())
    }
    
}

extension UITextView {
    
    open override func awakeFromNib() {
        self.font = self.font?.withSize((self.font?.pointSize.relativeToIphone8Width())!)
    }
    
}

extension UITextField {
    
    open override func awakeFromNib() {
        self.font = self.font?.withSize((self.font?.pointSize.relativeToIphone8Width())!)
    }
    
}

extension UIButton {
    
    open override func awakeFromNib() {
        self.titleLabel?.font = self.titleLabel?.font.withSize((self.titleLabel?.font.pointSize.relativeToIphone8Width())!)
    }
    
}
