//
//  Cell.swift
//  Four in a row
//
//  Created by Константин on 22.01.2021.
//

import UIKit

final class Cell : UIView {
    
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.frame.size = CGSize(width: cellSize, height: cellSize)
        let image = UIImage(named: "cell")
        let imageview = UIImageView(image: image)
        imageview.frame = self.bounds
        self.addSubview(imageview)

        print(self.frame.size)
    }
    
}
