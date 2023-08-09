//
//  UIViewExtention.swift
//  MouvieApp_MVVM
//
//  Created by Xursandbek Qambaraliyev on 07/08/23.
//

import Foundation
import UIKit

extension UIView {
    
    func round(_ radius: CGFloat = 10) {
        
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(collor: UIColor, width: CGFloat) {
        
        self.layer.borderWidth = width
        self.layer.borderColor = collor.cgColor
    }
}
