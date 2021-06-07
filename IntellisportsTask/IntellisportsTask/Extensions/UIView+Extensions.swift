//
//  UIView+Extensions.swift
//  IntellisportsTask
//
//  Created by ijaz ahmad on 2021-06-07.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners() {
        self.layer.cornerRadius = self.frame.height/2
    }
    
    func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func border(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    func shadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
    }
}
