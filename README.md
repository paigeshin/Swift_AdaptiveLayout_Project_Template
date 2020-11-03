# Swift_AdaptiveLayout_Project_Template

[Adaptive Layout URL Reference](https://medium.com/@nikeshakya51/responsive-design-in-ios-b35dc7f22821)

# How to use this framework

1. Development Device: iPhone 8 => Design your code with iPhone8 Model. 

2. Create CGFloat Extension

```swift

import Foundation
import UIKit

let minScalableValue: CGFloat = 8.0 // Min value that should undergo upper scaling for bigger iphones and iPads
extension CGFloat {
    
    func relativeToIphone8Width(shouldUseLimit: Bool = true) -> CGFloat {
        let upperScaleLimit: CGFloat = 1.8
        var toUpdateValue = floor(self * (UIScreen.main.bounds.width / 375))
        guard self > minScalableValue else {return toUpdateValue}
        guard shouldUseLimit else {return toUpdateValue}
        guard upperScaleLimit > 1 else {return toUpdateValue}
        let limitedValue = self * upperScaleLimit
        if toUpdateValue > limitedValue {
            toUpdateValue = limitedValue
        }
        return toUpdateValue
    }
    
    func relativeToIphone8Height(shouldUseLimit: Bool = true) -> CGFloat {
        var extraHeight: CGFloat = 0
        if #available(iOS 11.0, *) {
            extraHeight = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            extraHeight = extraHeight + (UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 20) - 20
        }
        let upperScaleLimit: CGFloat = 1.8
        var toUpdateValue = floor(self * ((UIScreen.main.bounds.height - extraHeight) / 667))
        guard self > minScalableValue else {return toUpdateValue}
        guard shouldUseLimit else {return toUpdateValue}
        guard upperScaleLimit > 1 else {return toUpdateValue}
        let limitedValue = self * upperScaleLimit
        if toUpdateValue > limitedValue {
            toUpdateValue = limitedValue
        }
        return toUpdateValue
    }
    
}

```

3. Create AdaptiveLayoutConstraint Class

```swift

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


```

4. Apply it to default UIKit Components


```swift

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


```