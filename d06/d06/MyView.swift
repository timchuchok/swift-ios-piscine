//
//  MyView.swift
//  d06
//
//  Created by Vladyslav Tymchenko on 12.10.17.
//  Copyright © 2017 Vladyslav Tymchenko. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    var lineWidth: CGFloat = 0
    
    fileprivate let shape = arc4random() % 2

    var shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = getRandomColor().cgColor
        shapeLayer.fillColor = getRandomColor().withAlphaComponent(0.5).cgColor
        return shapeLayer
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.addSublayer(shapeLayer)
        shapeLayer.lineWidth = lineWidth
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        if shape == 0 {
            shapeLayer.path = circularPath(lineWidth: lineWidth, center: center).cgPath
        } else {
            shapeLayer.path = rectanglePath(flag: true).cgPath
        }
    }
    
    private func circularPath(lineWidth: CGFloat = 0, center: CGPoint = .zero) -> UIBezierPath {
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
        return UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
    }
    
    private func rectanglePath(flag: Bool = false) -> UIBezierPath {
        if flag {
            return UIBezierPath(rect: bounds)
        } else {
            return UIBezierPath(rect: CGRect(x: bounds.minX - bounds.midX, y: bounds.minY - bounds.midY, width: bounds.width, height: bounds.height))
        }
    }
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType { return .path }
    
    override var collisionBoundingPath: UIBezierPath {
        if shape == 0 {
            return circularPath()
        }
        return rectanglePath()
    }
    
    static func getRandomColor() -> UIColor {
        let red: CGFloat = CGFloat(Double(arc4random()) / Double(UINT32_MAX))
        let green: CGFloat = CGFloat(Double(arc4random()) / Double(UINT32_MAX))
        let blue: CGFloat = CGFloat(Double(arc4random()) / Double(UINT32_MAX))
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

}
