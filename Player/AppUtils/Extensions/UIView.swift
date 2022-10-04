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
    
    func constraint(to toItem: Any?,
                    the item: Any? = nil,
                    by: [NSLayoutConstraint.Attribute]? = nil,
                    by_itemItem: [NSLayoutConstraint.Attribute: NSLayoutConstraint.Attribute]? = nil,
                    relation: NSLayoutConstraint.Relation = .equal,
                    multiplier: CGFloat = 1,
                    constant: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let attributes = by {
            
            for attribute in attributes {
                
                self.superview?.addConstraint(NSLayoutConstraint(item: item ?? self,
                                                                 attribute: attribute,
                                                                 relatedBy: relation,
                                                                 toItem: toItem,
                                                                 attribute: attribute,
                                                                 multiplier: multiplier,
                                                                 constant: constant))
            }
        }
        guard let attributes = by_itemItem else {return}
        for attribute in attributes {
            
            self.superview?.addConstraint(NSLayoutConstraint(item: item ?? self,
                                                             attribute: attribute.key,
                                                             relatedBy: relation,
                                                             toItem: toItem,
                                                             attribute: attribute.value,
                                                             multiplier: multiplier,
                                                             constant: constant))
        }
    }
}
