//
//  HTIndicatorView5.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 6/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicatorView5: UIView {
    
    //MARK:- SUPPORT VARIABLES
    private var isAnimate: Bool = true
    
    private let groupAnimation = CAAnimationGroup()
    private let sizeAnimation = CABasicAnimation(keyPath: "bounds.size")
    private let cornerRadiusAnimation = CABasicAnimation(keyPath: "cornerRadius")
    private let fadeAnimation = CABasicAnimation(keyPath: "opacity")
    private let fadeOutAnimation = CABasicAnimation(keyPath: "opacity")
    
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
        self.subviews.forEach({ $0.removeFromSuperview()})
        isAnimate = false
    }
    
    func startAnimate() {
        isAnimate = true
        createIndicator()
    }
    
    //MARK: - Config
    private func createIndicator(){
        
        for i in 0...4 {
            
            let circle = UIView(frame: CGRect(x: frame.size.width / 2, y: frame.size.width / 2, width: 0, height: 0))
            circle.layer.borderColor = self.color.cgColor
            circle.layer.borderWidth = frame.size.width / 40
            circle.alpha = 0.1
            
            self.addSubview(circle)
            
            animate(view: circle, delay: Double(i) / 5 * 0.5 )
        }
    }
    
    private func animate(view: UIView, delay: TimeInterval) {
        if isAnimate {
            view.layer.removeAnimation(forKey: "animateCircle")
            CATransaction.begin()
            CATransaction.setAnimationDuration(0.7)
            
            groupAnimation.beginTime = round(10*CACurrentMediaTime())/10 + delay
            groupAnimation.fillMode = kCAFillModeForwards
            groupAnimation.isRemovedOnCompletion = false
            
            sizeAnimation.fromValue = NSValue(cgSize: CGSize.zero)
            sizeAnimation.toValue = NSValue(cgSize: CGSize(width: self.frame.size.width, height: self.frame.size.width))
            
            cornerRadiusAnimation.fromValue = 0
            cornerRadiusAnimation.toValue = self.frame.width / 2
            
            fadeAnimation.fromValue = 0.1
            fadeAnimation.toValue = 0.6
            
            CATransaction.setCompletionBlock {
                self.animateFadeOut(view: view)
            }
        
            groupAnimation.animations = [sizeAnimation, cornerRadiusAnimation, fadeAnimation]
            view.layer.add(groupAnimation, forKey: "animateCircle")
            
            CATransaction.commit()
        }
    }
    
    private func animateFadeOut(view: UIView) {
        view.layer.removeAnimation(forKey: "animateFadeOut")
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.5)
        
        self.fadeOutAnimation.fromValue = 0.6
        self.fadeOutAnimation.toValue = 0
        self.fadeOutAnimation.isRemovedOnCompletion = false
        self.fadeOutAnimation.fillMode = kCAFillModeForwards
        
        CATransaction.setCompletionBlock({
            self.animate(view: view, delay: 0.2)
        })
        
        view.layer.add(self.fadeOutAnimation, forKey: "animateFadeOut")
        
        CATransaction.commit()
    }
}




















