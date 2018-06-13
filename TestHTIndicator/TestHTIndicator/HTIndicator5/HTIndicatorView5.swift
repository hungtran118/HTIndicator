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
    private var isNotAnimated: Bool = true
    
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
        
        UIView.animate(withDuration: 0.7, delay: delay, options: [.curveLinear], animations: {
            view.bounds = CGRect(origin: view.frame.origin, size: CGSize(width: self.frame.size.width, height: self.frame.size.width))
            view.alpha = 0.6
            view.layer.cornerRadius = view.frame.width / 2
            view.layer.masksToBounds = view.frame.width / 2 > 0
        }) { _ in
            
            UIView.animate(withDuration: 0.5, animations: {
                view.alpha = 0
            }, completion: { _ in
                view.bounds = CGRect(origin: view.frame.origin, size: CGSize(width: 0, height: 0))
                view.layer.cornerRadius = view.frame.width / 2
                view.layer.masksToBounds = view.frame.width / 2 > 0
                view.alpha = 0.1
                self.animate(view: view, delay: 0.2)
            })
        }
    }
}




















