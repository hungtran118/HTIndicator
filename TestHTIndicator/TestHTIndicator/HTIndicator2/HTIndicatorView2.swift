//
//  HTIndicatorView2.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 6/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicatorView2: UIView {
    
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
    }
    
    func startAnimate() {
        createIndicator()
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
            animate(view: dot, delay: Double(i) * 0.12)
        }
    }
    
    private func animate(view: UIView, delay: Double) {
        
        let dotSize = self.frame.width * 0.3
        
        UIView.animate(withDuration: 0.3, delay: delay, options: [], animations: {
            view.bounds = CGRect(origin: view.frame.origin, size: CGSize(width: dotSize * 0.3, height: dotSize * 0.3))
            view.layer.cornerRadius = view.frame.width / 2
            view.layer.masksToBounds = dotSize / 2 > 0
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                view.bounds = CGRect(origin: view.frame.origin, size: CGSize(width: dotSize, height: dotSize))
                view.layer.cornerRadius = view.frame.width / 2
                view.layer.masksToBounds = dotSize / 2 > 0
            }, completion: { _ in
                self.animate(view: view, delay: 0.3)
            })
        })
    }
}


















