//
//  CustomProgressBar.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/24/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit

class CustomProgressBar: UIView {
        
        @IBInspectable var color: UIColor? = .gray
        var progress: CGFloat = 0.68
        
        override func draw(_ rect: CGRect) {
            let backgroundMask = CAShapeLayer()
            backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).cgPath
            layer.mask = backgroundMask
            
            let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))
            
            let progressLayer = CALayer()
            
            progressLayer.frame = progressRect
            progressLayer.accessibilityPath = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25)
            
            let label = CATextLayer()
            label.frame =  CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))
            label.string = "\(Int(progress*100))%"
            label.alignmentMode = .right
            
            label.fontSize = 19
            progressLayer.addSublayer(label)
            
            layer.addSublayer(progressLayer)
            progressLayer.backgroundColor = color?.cgColor
        }
        
}
