//
//  RestartButton.swift
//  Four in a row
//
//  Created by Константин on 10.03.2021.
//

import UIKit

extension UIButton {
    func touchDown() {
        alpha = 0.6
    }
    
    func touchUp() {
        alpha = 1
    }
}


final class RestartButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                touchDown()
            } else {
                cancelTracking(with: nil)
                touchUp()
            }
        }
    }
    
    init() {
        super.init(frame: .zero)
        self.setupUI()
    }
    
    func setupUI() {
        let image = UIImage(named: "restartButton")
        self.setImage(image, for: .normal)
        self.imageView?.frame = self.bounds
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

final class CancelButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                touchDown()
            } else {
                cancelTracking(with: nil)
                touchUp()
            }
        }
    }
    
    init() {
        super.init(frame: .zero)
        self.setupUI()
    }
    
    func setupUI() {
        let image = UIImage(named: "cancelButton")
        self.setImage(image, for: .normal)
        self.imageView?.frame = self.bounds
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

