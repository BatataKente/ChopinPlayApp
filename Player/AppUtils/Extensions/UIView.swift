//
//  UIViewExtension.swift
//  Player
//
//  Created by Josicleison on 30/09/22.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        
        for view in views {
            
            self.addSubview(view)
        }
    }
}
