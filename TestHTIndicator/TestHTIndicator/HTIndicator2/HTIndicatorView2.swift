//
//  HTIndicatorView2.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 6/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicatorView2: UIView {
    
    //MARK:- SUPPORT VARIABLES
    private var isAnimate: Bool = true
    private var dotSize: CGFloat = 0
    
    private let groupAnimation = CAAnimationGroup()
    private let sizeAnimation = CABasicAnimation(keyPath: "bounds.size")
    private let cornerRadiusAnimation = CABasicAnimation(keyPath: "cornerRadius")
    
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
        isAnimate = false
    }
    
    func startAnimate() {
        isAnimate = true
        dotSize = self.frame.width * 0.3
        createIndicator()
    }
    
    //MARK: - Config
    private func createIndicator(){
        
        let dotSpace = self.frame.width * 0.05
        
        for i in 0..<3 {
            let dot = UIView(frame: CGRect(x: CGFloat(i) * (dotSize + dotSpace), y: (self.frame.width - dotSize) / 2, width: dotSize, height: dotSize))
            dot.backgroundColor = self.color
            dot.layer.cornerRadius = dotSize / 2
            self.addSubview(dot)
            animate(view: dot, delay: Double(i) * 0.13)
        }
    }
    
    private func animate(view: UIView, delay: Double) {
        if isAnimate {
            groupAnimation.duration = 1
            groupAnimation.beginTime = round(100*CACurrentMediaTime())/100 + delay
            groupAnimation.repeatCount = HUGE
            
            sizeAnimation.fromValue = NSValue(cgSize: view.frame.size)
            sizeAnimation.toValue = NSValue(cgSize: CGSize(width: view.frame.size.width * 0.3, height: view.frame.size.width * 0.3))
            sizeAnimation.duration = 0.3
            sizeAnimation.autoreverses = true
            
            cornerRadiusAnimation.fromValue = view.frame.width / 2
            cornerRadiusAnimation.toValue = (view.frame.width * 0.3) / 2
            cornerRadiusAnimation.duration = 0.3
            cornerRadiusAnimation.autoreverses = true
            
            groupAnimation.animations = [sizeAnimation, cornerRadiusAnimation]
            view.layer.add(groupAnimation, forKey: nil)
        }
    }
}


















