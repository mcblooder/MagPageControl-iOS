//
//  MagPageControl.swift
//
//  Created by Rodion on 18.07.2019.
//  Copyright © 2019. All rights reserved.
//

import Foundation
import UIKit

open class MagPageControl: UIControl {
    
    public weak var delegate: MagPageControlDelegate?  {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var currentPage: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var numberOfPages: Int = 0 {
        didSet {
            if currentPage >= numberOfPages {
                currentPage = numberOfPages - 1
            }
            setNeedsDisplay()
            invalidateIntrinsicContentSize()
        }
    }
    
    public var hidesForSinglePage = false
    public var vertical = false
    
    public var dotSize: CGFloat = 7.0
    public var dotSpacing: CGFloat = 10.0
    public var selectedDotSize: CGFloat?
    public var extendSize: CGSize = .zero
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .redraw
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentMode = .redraw
    }
    
    func calculateSize(for numberOfPages: Int) -> CGSize {
        let width = dotSize + (dotSize + dotSpacing) * CGFloat(numberOfPages - 1)
        return vertical ? CGSize(width: dotSize, height: width) : CGSize(width: width, height: dotSize)
    }
    
    func updateCurrentPageDisplay() {
        self.setNeedsDisplay()
    }
    
    override open func draw(_ rect: CGRect) {
        guard numberOfPages > 1 || hidesForSinglePage == false else { return }
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.clear(rect)
        
        backgroundColor?.setFill()
        context.fill(rect)
        
        let size = calculateSize(for: numberOfPages)
        
        if vertical {
            context.translateBy(x: frame.size.width / 2, y: (frame.size.height - size.height) / 2)
        } else {
            context.translateBy(x: (frame.size.width - size.width) / 2, y: frame.size.height / 2)
        }
        
        for i in 0..<numberOfPages {
            let isSelected = i == currentPage
            
            context.saveGState()
            
            let offset: CGFloat = (dotSize + dotSpacing) * CGFloat(i) + dotSize / 2
            context.translateBy(x: vertical ? 0 : offset, y: vertical ? offset : 0)
                        
            let drawable = delegate?.pageControl(self, dotFor: i, isSelected: isSelected) ?? CircleDot()
            let options = drawable.options ?? DotOptions()
            
            if isSelected {
                options.selectedColor.setFill()
            } else {
                (options.color ?? options.selectedColor.withAlphaComponent(0.25)).setFill()
            }
            
            drawable.draw(on: context, dotSize: i == currentPage ? dotSize : (selectedDotSize ?? dotSize))
            context.drawPath(using: .fill)
            
            context.restoreGState()
        }
    }
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = calculateSize(for: numberOfPages)
        if let selectedDotSize = selectedDotSize {
            let width: CGFloat = selectedDotSize - dotSize
            let height = max(36, max(dotSize, selectedDotSize))
            size.width = vertical ? height : size.width + width
            size.height = vertical ? size.height + width : height
        }
        
        size.width += vertical ? extendSize.height : extendSize.width
        size.height += vertical ? extendSize.width : extendSize.height
        
        return size
    }
    
    override open var intrinsicContentSize: CGSize {
        return sizeThatFits(bounds.size)
    }
}

public protocol CGContextDrawableDot {
    var options: DotOptions? { get set }
    func draw(on context: CGContext, dotSize: CGFloat)
}

public protocol MagPageControlDelegate: class {
    func pageControl(_ pageControl: MagPageControl?, dotFor index: Int, isSelected: Bool) -> CGContextDrawableDot
}
