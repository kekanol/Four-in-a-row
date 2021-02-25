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
    let preCircle = Circle(color: UIColor.black.withAlphaComponent(0))
    var isColored = false
    var isEmpty: Bool = true
    
    init(stroke: Int, row: Int) {
        self.stroke = stroke
        self.row = row
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.frame.size = CGSize(width: cellSize, height: cellSize)
        self.addSubview(preCircle)
        preCircle.frame = self.bounds
        let image = UIImage(named: "cell")
        let imageview = UIImageView(image: image)
        imageview.frame = self.bounds
        self.addSubview(imageview)
    }
    
    @objc func touched(color: UIColor) {
        self.preCircle.color = color
    }
    
}
