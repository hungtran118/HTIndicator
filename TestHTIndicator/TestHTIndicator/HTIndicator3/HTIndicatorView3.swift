//
//  HTIndicatorView3.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 6/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicatorView3: UIView {
    
    //MARK:- SUPPORT VARIABLES
    private var isNotAnimated: Bool = true
    
    //MARK:- Custom color
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
    
    //MARK:- Init
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
        
        let dotSize = self.frame.width * 0.3
        let dotSpace = self.frame.width * 0.05
        
        for i in 0..<3 {
            let dot = UIView(frame: CGRect(x: CGFloat(i) * (dotSize + dotSpace), y: (self.frame.width - dotSize) / 2, width: dotSize, height: dotSize))
            dot.backgroundColor = self.color
            dot.layer.cornerRadius = dotSize / 2
            self.addSubview(dot)
            animate(view: dot, delay: Double(i) * 0.1)
        }
    }
    
    private func animate(view: UIView, delay: Double) {
        
        let dotSize = self.frame.width * 0.3
        
        UIView.animate(withDuration: 0.3, delay: delay, options: [], animations: {
            view.frame.origin = CGPoint(x: view.frame.origin.x, y: view.frame.origin.y - dotSize * 0.8)
            view.layer.cornerRadius = view.frame.width / 2
            view.layer.masksToBounds = dotSize / 2 > 0
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                view.frame.origin = CGPoint(x: view.frame.origin.x, y: view.frame.origin.y + dotSize * 0.8)
                view.layer.cornerRadius = view.frame.width / 2
                view.layer.masksToBounds = dotSize / 2 > 0
            }, completion: { _ in
                self.animate(view: view, delay: 0.3)
            })
        })
    }
}



















