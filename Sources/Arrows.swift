//
//  Arrows.swift
//  Arrows
//
//  Created by Antonio Casero Palmero on 10.10.18.
//  Copyright © 2018 Arrows. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class ArrowView: UIView {
    
    open var arrowPosition: Position = .middle
    open var arrowColor: UIColor = .black {
        didSet {
            arrowLayer.fillColor = arrowColor.cgColor
        }
    }
    open var arrowAnimationDuration: Double = 0.15

    public enum Position: CGFloat, CaseIterable {
        case down = -0.15625
        case middle = 0.15625
        case up = 0.0
    }

    fileprivate lazy var arrowFrame: CGRect = {
        return self.bounds
    }()

    fileprivate lazy var arrowLayer: CAShapeLayer = {
        let _arrowlayer = CAShapeLayer()
        _arrowlayer.fillColor = arrowColor.cgColor
        _arrowlayer.frame = self.bounds
        self.layer.addSublayer(_arrowlayer)
        return _arrowlayer
    }()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit(){
        layer.frame = self.bounds
        backgroundColor = .clear
        update(to: arrowPosition, animated: false)
    }

    private func arrowPath(value: CGFloat) -> UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: arrowFrame.minX + 0.8330 * frame.width, y: arrowFrame.minY + 0.43631 * arrowFrame.height))

        //Up
        bezierPath.addLine(to: CGPoint(x: arrowFrame.minX + 0.50000 * frame.width, y: arrowFrame.minY +  (0.43631 + value) * arrowFrame.height))
        bezierPath.addLine(to: CGPoint(x: arrowFrame.minX + 0.16702 * frame.width, y: arrowFrame.minY +  0.43631 * arrowFrame.height))
        bezierPath.addCurve(to: CGPoint(x: arrowFrame.minX + 0.14545 * frame.width, y: arrowFrame.minY + 0.51972 * arrowFrame.height),
                            controlPoint1: CGPoint(x: arrowFrame.minX + 0.14754 * frame.width, y: arrowFrame.minY + 0.45044 * arrowFrame.height),
                            controlPoint2: CGPoint(x: arrowFrame.minX + 0.13788 * frame.width, y: arrowFrame.minY + 0.48781 * arrowFrame.height))
        bezierPath.addCurve(to: CGPoint(x: arrowFrame.minX + 0.16696 * frame.width, y: arrowFrame.minY + 0.56781 * arrowFrame.height),
                            controlPoint1: CGPoint(x: arrowFrame.minX + 0.15302 * frame.width, y: arrowFrame.minY + 0.55169 * arrowFrame.height),
                            controlPoint2: CGPoint(x: arrowFrame.minX + 0.16696 * frame.width, y: arrowFrame.minY + 0.56781 * arrowFrame.height))

        //Down
        bezierPath.addLine(to: CGPoint(x: arrowFrame.minX + 0.50000 * frame.width, y: arrowFrame.minY +  (0.56791 + value) * arrowFrame.height))
        bezierPath.addLine(to: CGPoint(x: arrowFrame.minX + 0.83304 * frame.width, y: arrowFrame.minY +  0.56781 * arrowFrame.height))
        bezierPath.addCurve(to: CGPoint(x: arrowFrame.minX + 0.85457 * frame.width, y: arrowFrame.minY + 0.51972 * arrowFrame.height),
                            controlPoint1: CGPoint(x: arrowFrame.minX + 0.83304 * frame.width, y: arrowFrame.minY + 0.56781 * arrowFrame.height),
                            controlPoint2: CGPoint(x: arrowFrame.minX + 0.84698 * frame.width, y: arrowFrame.minY + 0.55166 * arrowFrame.height))
        bezierPath.addCurve(to: CGPoint(x: arrowFrame.minX + 0.83300 * frame.width, y: arrowFrame.minY + 0.43631 * arrowFrame.height),
                            controlPoint1: CGPoint(x: arrowFrame.minX + 0.86212 * frame.width, y: arrowFrame.minY + 0.48781 * arrowFrame.height),
                            controlPoint2: CGPoint(x: arrowFrame.minX + 0.85246 * frame.width, y: arrowFrame.minY + 0.45044 * arrowFrame.height))


        bezierPath.close()
        bezierPath.miterLimit = 4
        return bezierPath
    }

    open func update(to position: Position, animated: Bool) {
        let oldPath = arrowLayer.path
        let newPath = arrowPath(value: position.rawValue).cgPath

        if (animated) {
            let animation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.path))
            animation.fromValue = oldPath
            animation.toValue = newPath
            animation.duration = arrowAnimationDuration
            animation.beginTime = CACurrentMediaTime()
            animation.fillMode = .backwards
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            arrowLayer.add(animation, forKey: animation.keyPath)
        }
        arrowLayer.path = newPath
        arrowPosition = position
    }
}
