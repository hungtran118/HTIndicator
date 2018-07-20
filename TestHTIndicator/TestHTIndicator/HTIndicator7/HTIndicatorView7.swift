//
//  HTIndicatorView5.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 6/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicatorView7: UIView {
    
    //MARK:- SUPPORT VARIABLES
    private var isAnimate: Bool = true
    private var dotSize: CGFloat = 0
    
    private var path = UIBezierPath()
    
    //MARK:- Custom color
    @IBInspectable var indicatorColor: UIColor {
        get {
            return self.color
        }
        set {
            self.color = newValue
        }
    }
    
    var color = UIColor.white
    
    //MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        path = UIBezierPath()
        isAnimate = false
    }
    
    func startAnimate() {
        isAnimate = true
        dotSize = self.frame.width / 5
        path.addArc(withCenter: CGPoint(x: self.bounds.width / 2, y: self.bounds.width / 2), radius: self.bounds.width / 2 - dotSize / 2, startAngle: -0.5 * .pi, endAngle: 1.5 * .pi, clockwise: true)
        createIndicator()
    }
    
    //MARK: - Config
    private func createIndicator(){
        
        for i in 0...4 {
            let size = dotSize - (CGFloat(4 - i) * (dotSize / 4))
            let dot = UIView(frame: CGRect(x: (frame.size.width - size) / 2, y: (dotSize - size) / 2, width: size, height: size))
            dot.backgroundColor = self.color
            dot.layer.cornerRadius = size / 2
            
            self.addSubview(dot)
            
            animate(view: dot, index: CGFloat(i), delay: Double(i + 1) / 20)
        }
    }
    
    private func animate(view: UIView, index: CGFloat, delay: TimeInterval) {
        if isAnimate {
            let size = dotSize - (CGFloat(index) * (dotSize / 4))
            
            let groupAnimation = CAAnimationGroup()
            let sizeAnimation = CABasicAnimation(keyPath: "bounds.size")
            let cornerRadiusAnimation = CABasicAnimation(keyPath: "cornerRadius")
            let clockwiseAnimation = CAKeyframeAnimation(keyPath: "position")
            
            groupAnimation.duration = 1.3
            groupAnimation.repeatCount = HUGE
            
            sizeAnimation.fromValue = NSValue(cgSize: view.frame.size)
            sizeAnimation.toValue = NSValue(cgSize: CGSize(width: size, height: size))
            sizeAnimation.fillMode = kCAFillModeForwards
            sizeAnimation.isRemovedOnCompletion = false
            sizeAnimation.duration = 1
            sizeAnimation.beginTime = delay
            
            cornerRadiusAnimation.fromValue = view.frame.width / 2
            cornerRadiusAnimation.toValue = size / 2
            cornerRadiusAnimation.fillMode = kCAFillModeForwards
            cornerRadiusAnimation.isRemovedOnCompletion = false
            cornerRadiusAnimation.duration = 1
            cornerRadiusAnimation.beginTime = delay
            
            clockwiseAnimation.path = path.cgPath
            clockwiseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            clockwiseAnimation.duration = 1
            clockwiseAnimation.beginTime = delay
            
            groupAnimation.animations = [sizeAnimation, cornerRadiusAnimation, clockwiseAnimation]
            view.layer.add(groupAnimation, forKey: "animateClockwise")
        }
    }
}




















