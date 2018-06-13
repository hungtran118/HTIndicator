//
//  HTIndicatorView6.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 6/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicatorView6: UIView {
    
    //MARK:- SUPPORT VARIABLES
    private var circleLayer = CAShapeLayer()
    private var isAnimating = false
    private var timer = Timer()
    private let animationFull = CABasicAnimation(keyPath: "strokeEnd")
    private let animationEmpty = CABasicAnimation(keyPath: "strokeEnd")
    private var circlePath = UIBezierPath()
    private var containerView = UIView()
    
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
        self.isAnimating = false
        containerView.layer.sublayers?.forEach({ $0.removeFromSuperlayer()})
        self.subviews.forEach({ $0.removeFromSuperview()})
    }
    
    func startAnimate() {
        createIndicator()
        animateCircle(duration: 1)
    }
    
    //MARK: - Config
    private func createIndicator() {
        containerView = UIView(frame: self.bounds)
        self.addSubview(containerView)
        animate(view: containerView)
    }
    
    private func animate(view: UIView) {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear], animations: {
            view.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear], animations: {
                view.transform = CGAffineTransform(rotationAngle: .pi*2)
            }, completion: { _ in
                self.animate(view: view)
            })
        })
    }
    
    private func animateCircle(duration: TimeInterval){
        self.isAnimating = true
        self.animateCircleFull(duration: duration)
    }
    
    private func formatCirle(circleLayer: CAShapeLayer, circlePath: UIBezierPath) {
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = color.cgColor
        circleLayer.lineWidth = frame.width / 20
        circleLayer.strokeEnd = 0.0
    }
    
    private func setCircleClockwise(){
        circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: 0, endAngle: CGFloat(.pi * 2.0), clockwise: true)
        self.circleLayer.removeAllAnimations()
        self.circleLayer.removeFromSuperlayer()
        formatCirle(circleLayer: self.circleLayer, circlePath: circlePath)
        self.containerView.layer.addSublayer(self.circleLayer)
    }
    
    private func setCircleCounterClockwise(){
        circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: -0.05 * CGFloat(.pi * 2.0), endAngle: CGFloat(.pi * 2.0), clockwise: false)
        self.circleLayer.removeAllAnimations()
        self.circleLayer.removeFromSuperlayer()
        formatCirle(circleLayer: self.circleLayer, circlePath: circlePath)
        self.containerView.layer.addSublayer(self.circleLayer)
    }
    
    private func animateCircleFull(duration: TimeInterval) {
        if self.isAnimating{
            CATransaction.begin()
            animationFull.duration = duration
            animationFull.fromValue = 0
            animationFull.toValue = 0.95
            animationFull.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animationFull.isRemovedOnCompletion = true
            circleLayer.strokeStart = 0
            circleLayer.strokeEnd = 0.95
            CATransaction.setCompletionBlock {
                self.setCircleCounterClockwise()
                self.animateCircleEmpty(duration: duration)
            }
            // Do the actual animation
            circleLayer.add(animationFull, forKey: "animateCircle")
            CATransaction.commit()
        }
    }
    
    private func animateCircleEmpty(duration: TimeInterval) {
        if self.isAnimating{
            CATransaction.begin()
            animationEmpty.duration = duration
            animationEmpty.fromValue = 1
            animationEmpty.toValue = 0
            animationEmpty.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animationEmpty.isRemovedOnCompletion = true
            circleLayer.strokeEnd = 0
            CATransaction.setCompletionBlock {
                self.setCircleClockwise()
                self.animateCircleFull(duration: duration)
            }
            // Do the actual animation
            circleLayer.add(animationEmpty, forKey: "animateCircle")
            CATransaction.commit()
        }
    }
}













