//
//  TunerView.swift
//  PitchBender
//
//  Created by Jesus Rios on 4/21/20.
//  Copyright © 2020 Spoon Inc. All rights reserved.
//

import Foundation
import UIKit

class TunerView : UIView {
    
    var path: UIBezierPath!
    var lineView : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        self.createPath()
        self.addLine()
        
        UIColor.lightGray.setFill()
        path.fill()
    }
    
    func createPath() {
        let center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        path = UIBezierPath(arcCenter: center, radius: frame.size.height/2, startAngle: CGFloat(180.0) * .pi/180, endAngle: CGFloat(0.0) * .pi/180, clockwise: true)
        path.close()

    }
    
    func addLine() {
        lineView = UIView(frame: CGRect(x: frame.size.width/2, y: 5, width: 1, height: frame.size.height/2 - 10))
        lineView.backgroundColor = .black
        self.addSubview(lineView)
    }

}
