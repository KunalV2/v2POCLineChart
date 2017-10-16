//
//  GraphBubbleView.swift
//  v2POCLineChart
//
//  Created by Kunal Parekh on 16/10/17.
//  Copyright © 2017 v2soltions. All rights reserved.
//

import UIKit
import CoreGraphics

class GraphBubbleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var borderWidth : CGFloat = 0.7 // Should be less or equal to the `radius` property

    func drawBubble(chartPointValue:Int){
        
        let label = UILabel(frame: CGRect(x: 5, y: 2, width: (self.frame.size.width-10), height: (self.frame.size.height-10)))
        label.textAlignment = .center
        label.text = String(chartPointValue)
        label.numberOfLines = 0
        label.font = UIFont(name: "Lato-Regular", size: 12)
        label.textColor = UIColor(red: 57/255.0, green: 57/255.0, blue: 57/255.0, alpha: 1)
        self.addSubview(label)
        
        let bubbleLayer = CAShapeLayer()
        bubbleLayer.path = bubblePathForContentSize().cgPath
        bubbleLayer.fillColor = UIColor.clear.cgColor
        bubbleLayer.strokeColor = UIColor(red: 88/255.0, green: 127/255.0, blue: 247/255.0, alpha: 1).cgColor
        bubbleLayer.lineWidth = borderWidth
        bubbleLayer.position = CGPoint.zero
        self.layer.masksToBounds = true

        self.layer.addSublayer(bubbleLayer)   
    }
    private func bubblePathForContentSize() -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 16, y: 1))
        path.addLine(to: CGPoint(x: 34, y: 1))
        path.addArc(withCenter: CGPoint(x: 34, y: 16), radius: 15, startAngle: -.pi/1.9, endAngle: .pi/1.9, clockwise: true)
        path.addLine(to: CGPoint(x: 30, y: 31))
        path.addLine(to: CGPoint(x: 25, y: 35))
        path.addLine(to: CGPoint(x: 21, y: 31))
        path.addArc(withCenter: CGPoint(x: 16, y: 16), radius: 15, startAngle: .pi/1.8, endAngle:-.pi/1.8 , clockwise: true)
        path.close()
        return path
    }
}


