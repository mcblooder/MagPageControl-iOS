//
//  ImageDot.swift
//  Yarche
//
//  Created by Rodion on 23.07.2019.
//  Copyright © 2019 MAG Development. All rights reserved.
//

import Foundation
import UIKit

public class ImageDot: CGContextDrawableDot {
    
    public var options: DotOptions?
    var image: UIImage
    
    public init(image: UIImage) {
        self.image = image
    }
    
    public func draw(on context: CGContext, dotSize: CGFloat) {
        guard let cgImage = image.cgImage else { return }
        context.draw(cgImage, in: CGRect(x: -image.size.width / 2,
                                         y: -image.size.height / 2,
                                         width: image.size.width,
                                         height: image.size.height))
    }
}
