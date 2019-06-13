//
//  UIView+PYSearchExtension.swift
//  PYSearchExample_Swift
//
//  Created by Himoo on 2019/6/13.
//  Copyright © 2019 Maxthon. All rights reserved.
//

import UIKit

extension UIView {
    
    func setPy_x(_ py_x: CGFloat) {
        var frame = self.frame
        frame.origin.x = py_x
        self.frame = frame
    }
    
    func py_x() -> CGFloat {
        return py_origin().x
    }
    
    func setPy_centerX(_ py_centerX: CGFloat) {
        var center = self.center
        center.x = py_centerX
        self.center = center
    }
    
    func py_centerX() -> CGFloat {
        return center.x
    }
    
    func setPy_centerY(_ py_centerY: CGFloat) {
        var center = self.center
        center.y = py_centerY
        self.center = center
    }
    
    func py_centerY() -> CGFloat {
        return center.y
    }
    
    func setPy_y(_ py_y: CGFloat) {
        var frame = self.frame
        frame.origin.y = py_y
        self.frame = frame
    }
    
    func py_y() -> CGFloat {
        return frame.origin.y
    }
    
    func setPy_size(_ py_size: CGSize) {
        var frame = self.frame
        frame.size = py_size
        self.frame = frame
        
    }
    
    func py_size() -> CGSize {
        return frame.size
    }
    
    func setPy_height(_ py_height: CGFloat) {
        var frame = self.frame
        frame.size.height = py_height
        self.frame = frame
    }
    
    func py_height() -> CGFloat {
        return frame.size.height
    }
    
    func setPy_width(_ py_width: CGFloat) {
        var frame = self.frame
        frame.size.width = py_width
        self.frame = frame
        
    }
    
    func py_width() -> CGFloat {
        return frame.size.width
    }
    
    func setPy_origin(_ py_origin: CGPoint) {
        var frame = self.frame
        frame.origin = py_origin
        self.frame = frame
    }
    
    func py_origin() -> CGPoint {
        return frame.origin
    }

}
