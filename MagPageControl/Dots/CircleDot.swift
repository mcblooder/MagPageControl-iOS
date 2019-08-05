//
//  CircleDot.swift
//
//  Created by Rodion on 23.07.2019.
//  Copyright © 2019. All rights reserved.
//

import Foundation
import UIKit

public class CircleDot: CGContextDrawableDot {
    
    public var options: DotOptions?
    
    public init() {}
    public func draw(on context: CGContext, dotSize: CGFloat) {
        context.addEllipse(in: CGRect(x: -dotSize / 2, y: -dotSize / 2, width: dotSize, height: dotSize))
    }
}
