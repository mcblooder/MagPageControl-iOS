//
//  DotOptions.swift
//  Yarche
//
//  Created by Rodion on 23.07.2019.
//  Copyright © 2019 MAG Development. All rights reserved.
//

import Foundation
import UIKit

public struct DotOptions {
    
    var color: UIColor?
    var selectedColor: UIColor = .black
    
    public init (color: UIColor? = nil,
          selectedColor: UIColor = .black) {
        self.color = color
        self.selectedColor = selectedColor
    }
}
