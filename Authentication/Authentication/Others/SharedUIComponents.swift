//
//  UIComponents.swift
//  Onboarding
//
//  Created by Raul Mena on 2/5/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit


/**
        Returns label for given properties
 */
func getLabel(text: String, adjustsToWidth: Bool?, numberOfLines: Int?,
              font: UIFont?, textColor: UIColor, textAlignment: NSTextAlignment?) -> UILabel {
    
    let label = UILabel()
    label.text = text
    
    if adjustsToWidth != nil{
        label.adjustsFontSizeToFitWidth = adjustsToWidth!
    }
    
    if numberOfLines != nil{
        label.numberOfLines = numberOfLines!
    }
    
    label.font = font
    label.textColor = textColor
    
    if textAlignment != nil{
        label.textAlignment = textAlignment!
    }
    
    return label
}
