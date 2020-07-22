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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        self.createPath()
        
        UIColor.gray.setFill()
        path.fill()
    }
    
    func createPath() {
        let center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        path = UIBezierPath(arcCenter: center, radius: frame.size.height/2, startAngle: CGFloat(180.0) * .pi/180, endAngle: CGFloat(0.0) * .pi/180, clockwise: true)
        
        path.close()

    }

}
