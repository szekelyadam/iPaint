//
//  ColorPicker.swift
//  iPaint
//
//  Created by Ádibádi on 21/02/16.
//  Copyright © 2016 Székely Ádám. All rights reserved.
//

import UIKit

@IBDesignable
class ColorPicker: UIView {

    @IBInspectable var colorCount: CGFloat = 10
    
    private var selectedColorIndex = 0
    
    var selectedColor = UIColor(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    
    var colorWidth: CGFloat {
        return bounds.width / CGFloat(colorCount)
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        for var i:CGFloat = 0; i < colorCount; i++ {
            let color = UIColor(hue: i * (1.0/colorCount), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            color.setFill()
            
            CGContextFillRect(context, CGRect(x: colorWidth * i, y: 0, width: colorWidth, height: bounds.height))
            
            if Int(i) == selectedColorIndex {
                UIColor.blackColor().setStroke()
                CGContextSetLineWidth(context, 2.0)
                
                CGContextStrokeRect(context, CGRect(x: colorWidth * i, y: 1, width: colorWidth - 1, height: bounds.height - 2))
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        commonInit()
    }
    
    func commonInit() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "handleTap:")
        addGestureRecognizer(tapRecognizer)
    }
    
    func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        let tapPoint = gestureRecognizer.locationInView(self)
        selectedColorIndex = Int(tapPoint.x / colorWidth)
        selectedColor = UIColor(hue: CGFloat(selectedColorIndex) * (1.0 / colorCount), saturation: 1.0, brightness: 1.0, alpha: 1.0)
        
        setNeedsDisplay()
    }
}

















