//
//  Circle.swift
//  Four in a row
//
//  Created by Константин on 22.01.2021.
//

import UIKit

final class Circle: UIView {
    
    private var color: UIColor
    
    
    init(color: UIColor) {
        self.color = color
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        self.layer.backgroundColor = self.color.cgColor
        self.layer.borderColor = self.color.cgColor
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}
