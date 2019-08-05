//
//  PlayDot.swift
//  Yarche
//
//  Created by Rodion on 23.07.2019.
//  Copyright © 2019 MAG Development. All rights reserved.
//

import Foundation
import UIKit

public class PlayDot: CGContextDrawableDot {
    
    public var options: DotOptions?
    
    public init() {}
    public func draw(on context: CGContext, dotSize: CGFloat) {
        context.move(to: CGPoint(x: -dotSize / 2, y: -dotSize / 2))
        context.addLine(to: CGPoint(x: dotSize / 2, y: 0))
        context.addLine(to: CGPoint(x: -dotSize / 2, y: dotSize / 2))
        context.addLine(to: CGPoint(x: -dotSize / 2, y: -dotSize / 2))
    }
}
