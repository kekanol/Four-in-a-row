//
//  Animations.swift
//  Four in a row
//
//  Created by Константин on 25.02.2021.
//

import UIKit

class Animation {
    
    var view: UIView
    
    init(with view: UIView) {
        self.view = view
    }
    
    
    func springAnimation() {
        let start = self.view.frame.origin.x
        UIView.animate(withDuration: 0.25) {
            self.view.frame.origin.x = start - self.view.frame.width / 2
        }
        UIView.animate(withDuration: 0.5) {
            self.view.frame.origin.x = start + self.view.frame.width / 2
        }
        UIView.animate(withDuration: 0.75) {
            self.view.frame.origin.x = start
            self.view.removeFromSuperview()
        }
        
    }
    
    func goDownAnimation(of cell: Cell) {
        let finish = self.view.frame.origin
        let start = CGPoint(x: finish.x, y: finish.y - cellSize * CGFloat(cell.stroke + 1))
        self.view.frame.origin = start
        
        UIView.animate(withDuration: 0.6) {
            self.view.frame.origin = finish
        }
    }
    
}
