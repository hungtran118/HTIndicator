//
//  HTIndicatorView4.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 6/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicatorView4: UIView {
    
    private var isNotAnimated: Bool = true
    
    @IBInspectable var indicatorColor: UIColor {
        get {
            return self.color!
        }
        set {
            self.color = newValue
        }
    }
    
    var color: UIColor? {
        didSet {
            if isNotAnimated {
                createIndicator()
            } else {
                isNotAnimated = false
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    override func layoutSubviews() {
        if color == nil {
            self.color = UIColor.white
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    //MARK: - Config
    private func createIndicator(){
        
        let dotSize = self.frame.width * 0.2
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
        
        let dotSize = self.frame.width * 0.2
        
        let input = delay * 8
        var duration:Double = 0
        var beginSize:CGFloat = 0
        var beginAlpha: CGFloat = 0
        var commingSize: CGFloat = 0
        var commingAlpha: CGFloat = 0
        
        if input == 0 || input == 4{
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
        
        UIView.animate(withDuration: duration, delay: 0, options: [], animations: {
            view.bounds = CGRect(origin: view.frame.origin, size: CGSize(width: beginSize, height: beginSize))
            view.alpha = beginAlpha
            view.layer.cornerRadius = view.frame.width / 2
            view.layer.masksToBounds = view.frame.width / 2 > 0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                view.bounds = CGRect(origin: view.frame.origin, size: CGSize(width: commingSize, height: commingSize))
                view.alpha = commingAlpha
                view.layer.cornerRadius = view.frame.width / 2
                view.layer.masksToBounds = view.frame.width / 2 > 0
            })
        })
    }
}




















