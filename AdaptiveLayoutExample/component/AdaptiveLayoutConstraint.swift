//
//  AdaptiveLayoutConstraint.swift
//  AdaptiveLayoutExample
//
//  Created by 신승현 on 2020/11/03.
//

import Foundation
import UIKit

class AdaptiveLayoutConstraint: NSLayoutConstraint {
    
    @IBInspectable var setAdaptiveLayout: Bool = false
    
    override func awakeFromNib() {
        if setAdaptiveLayout {
            self.constant = self.constant.relativeToIphone8Width()
            
            if let firstView = self.firstItem as? UIView {
                firstView.layoutIfNeeded()
            }
            
            if let secondView = self.secondItem as? UIView {
                secondView.layoutIfNeeded()
            }
            
        }
    }
    
}
