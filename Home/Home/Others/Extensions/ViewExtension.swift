//
//  ViewExtension.swift
//  Onboarding
//
//  Created by Raul Mena on 2/5/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

extension UIView{
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil,
                height: CGFloat? = nil, width: CGFloat? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, padding: UIEdgeInsets = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false                                               // Activate auto layout
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true         // bottom and trailing constants must be negative
        }
        
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true      // bottom and trailing constants must be negative
        }
        
        if let height = height{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width = width{
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let centerX = centerX{
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY{
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
    }
    
}

