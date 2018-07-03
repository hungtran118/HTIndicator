//
//  HTIndicatorView4.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 6/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicatorView4: UIView {
    
    //MARK:- SUPPORT VARIABLES
    private var isAnimate: Bool = true
    private var dotSize: CGFloat = 0
    
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
        self.subviews.forEach({ $0.removeFromSuperview()})
    }
    
    func startAnimate() {
        dotSize = self.frame.width * 0.2
        isAnimate = true
        createIndicator()
    }
    
    //MARK: - Config
    private func createIndicator(){
        
        let midPos = (self.frame.width - dotSize) / 2
        
        //top
        createDot(withFrame: CGRect(x: midPos, y: 0, width: dotSize, height: dotSize), delay: 0)
        
        //top right
        createDot(withFrame: CGRect(x: midPos + (midPos / sqrt(2)), y: midPos - (midPos / sqrt(2)), width: dotSize, height: dotSize), delay: 1/8)
        
        //right
        createDot(withFrame: CGRect(x: midPos * 2, y: midPos, width: dotSize, height: dotSize), delay: 2/8)
        
        //bot right
        createDot(withFrame:  CGRect(x: midPos + (midPos / sqrt(2)), y: midPos + (midPos / sqrt(2)), width: dotSize, height: dotSize), delay: 3/8)
        
        //bot
        createDot(withFrame: CGRect(x: midPos, y: midPos * 2, width: dotSize, height: dotSize), delay: 4/8)
        
        //bot left
        createDot(withFrame: CGRect(x: midPos - (midPos / sqrt(2)), y: midPos + (midPos / sqrt(2)), width: dotSize, height: dotSize), delay: 5/8)
        
        //left
        createDot(withFrame: CGRect(x: 0, y: midPos, width: dotSize, height: dotSize), delay: 6/8)
        
        //top left
        createDot(withFrame: CGRect(x: midPos - (midPos / sqrt(2)), y: midPos - (midPos / sqrt(2)), width: dotSize, height: dotSize), delay: 7/8)
    }
    
    private func createDot(withFrame frame: CGRect, delay: Double) {
        
        let dot = UIView()
        dot.frame.origin = frame.origin
        dot.backgroundColor = self.color
        self.addSubview(dot)
        
        let input = delay * 8
        if input == 0 {
            dot.frame.size = frame.size
        } else if input == 1 || input == 7 {
            dot.frame.size = CGSize(width: frame.size.width * 7/8, height: frame.size.width * 7/8)
            dot.alpha = 7/8
        } else if input == 2 || input == 6 {
            dot.frame.size = CGSize(width: frame.size.width * 6/8, height: frame.size.width * 6/8)
            dot.alpha = 6/8
        } else if input == 3 || input == 5 {
            dot.frame.size = CGSize(width: frame.size.width * 5/8, height: frame.size.width * 5/8)
            dot.alpha = 5/8
        } else {
            dot.frame.size = CGSize(width: frame.size.width * 4/8, height: frame.size.width * 4/8)
            dot.alpha = 4/8
        }
        
        dot.layer.cornerRadius = dot.frame.width / 2
        dot.layer.masksToBounds = dot.frame.width / 2 > 0
        animate(view: dot, delay: delay)
    }
    
    private func animate(view: UIView, delay: Double) {
        if isAnimate {
            let input = delay * 8
            var duration: Double = 0
            var beginSize: CGFloat = 0
            var beginAlpha: CGFloat = 0
            var commingSize: CGFloat = 0
            var commingAlpha: CGFloat = 0
            
            if input == 0 || input == 4 {
                duration = 0
            } else if input == 1 || input == 5 {
                duration = 0.5 - 3/8
            } else if input == 2 || input == 6 {
                duration = 0.5 - 2/8
            } else if input == 3 || input == 7 {
                duration = 0.5 - 1/8
            } else {
                duration = 0.5
            }
            
            if input == 0 || input == 1 || input == 2 || input == 3 {
                beginSize = dotSize
                beginAlpha = 1
                commingSize = dotSize / 2
                commingAlpha = 0.5
            } else {
                beginSize = dotSize / 2
                beginAlpha = 0.5
                commingSize = dotSize
                commingAlpha = 1
            }
            
            configAniamte(view: view, duration: duration, beginSize: beginSize, beginAlpha: beginAlpha, commingSize: commingSize, commingAlpha: commingAlpha)
        }
    }
    
    private func configAniamte(view: UIView, duration: Double, beginSize: CGFloat, beginAlpha: CGFloat, commingSize: CGFloat, commingAlpha: CGFloat) {
        
        //Beginning animate
        CATransaction.begin()
        CATransaction.setAnimationDuration(duration)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        
        let groupAnimation = CAAnimationGroup()
        let sizeAnimation = CABasicAnimation(keyPath: "bounds.size")
        let cornerRadiusAnimation = CABasicAnimation(keyPath: "cornerRadius")
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        
        groupAnimation.fillMode = kCAFillModeForwards
        groupAnimation.isRemovedOnCompletion = false
        
        sizeAnimation.fromValue = NSValue(cgSize: view.frame.size)
        sizeAnimation.toValue = NSValue(cgSize: CGSize(width: beginSize, height: beginSize))
        
        cornerRadiusAnimation.fromValue = view.frame.size.width / 2
        cornerRadiusAnimation.toValue = beginSize / 2
        
        fadeAnimation.fromValue = view.alpha
        fadeAnimation.toValue = beginAlpha
        
        CATransaction.setCompletionBlock {
            
            //Comming animate
            CATransaction.begin()
            CATransaction.setAnimationDuration(0.5)
            CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
            
            let groupAnimation2 = CAAnimationGroup()
            let sizeAnimation2 = CABasicAnimation(keyPath: "bounds.size")
            let cornerRadiusAnimation2 = CABasicAnimation(keyPath: "cornerRadius")
            let fadeAnimation2 = CABasicAnimation(keyPath: "opacity")
            
            groupAnimation2.autoreverses = true
            groupAnimation2.repeatCount = HUGE
            
            sizeAnimation2.fromValue = NSValue(cgSize: CGSize(width: beginSize, height: beginSize))
            sizeAnimation2.toValue = NSValue(cgSize: CGSize(width: commingSize, height: commingSize))
            
            cornerRadiusAnimation2.fromValue = beginSize / 2
            cornerRadiusAnimation2.toValue = commingSize / 2
            
            fadeAnimation2.fromValue = beginAlpha
            fadeAnimation2.toValue = commingAlpha
            
            groupAnimation2.animations = [sizeAnimation2, cornerRadiusAnimation2, fadeAnimation2]
            view.layer.add(groupAnimation2, forKey: nil)
            
            CATransaction.commit()
        }
        
        groupAnimation.animations = [sizeAnimation, cornerRadiusAnimation, fadeAnimation]
        view.layer.add(groupAnimation, forKey: nil)
        
        CATransaction.commit()
    }
}




















