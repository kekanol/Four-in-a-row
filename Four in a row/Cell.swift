//
//  Cell.swift
//  Four in a row
//
//  Created by Константин on 22.01.2021.
//

import UIKit

final class Cell : UIView {
    
    var stroke: Int
    var row: Int
    let circle = Circle(color: UIColor.black.withAlphaComponent(0))
    var isColored = false
    var isEmpty: Bool = true
    var isPreCell: Bool = false
    
    init(stroke: Int, row: Int) {
        self.stroke = stroke
        self.row = row
        super.init(frame: .zero)
        setupUI()
    }
    
    init(row: Int, isPrecell: Bool) {
        self.stroke = -1
        self.row = row
        self.isPreCell = isPrecell
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.frame.size = CGSize(width: cellSize, height: cellSize)
        self.addSubview(circle)
        circle.frame.origin = CGPoint(x: self.frame.origin.x +  self.bounds.size.width * 0.07, y: self.frame.origin.y + self.bounds.size.height * 0.07)
        circle.frame.size = CGSize(width: self.bounds.size.width * 0.84, height: self.bounds.size.height * 0.84)
        if !isPreCell {
            let image = UIImage(named: "cell")
            let imageview = UIImageView(image: image)
            imageview.frame = self.bounds
            self.addSubview(imageview)
        }
    }
}
