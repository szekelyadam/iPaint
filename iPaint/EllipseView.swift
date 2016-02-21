//
//  EllipseView.swift
//  iPaint
//
//  Created by Ádibádi on 21/02/16.
//  Copyright © 2016 Székely Ádám. All rights reserved.
//

import UIKit

@IBDesignable
class EllipseView: UIView {
    @IBInspectable var color: UIColor = UIColor.blueColor()
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let ellipseRect = CGRect(x: 4, y: 4, width: self.bounds.width - 8, height: self.bounds.height - 8)
        color.setFill()
        CGContextFillEllipseInRect(context, ellipseRect)
        
        let strokeColor = color.colorWithAlphaComponent(0.4)
        strokeColor.setStroke()
        CGContextSetLineWidth(context, 8.0)
        CGContextStrokeEllipseInRect(context, ellipseRect)
    }
}
