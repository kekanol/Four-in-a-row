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
    
    func goDownAnimation() {
        if view.isKind(of: Cell.self) {
            let cell = view as! Cell
            let finish = cell.circle.frame.origin
            let start = CGPoint(x: finish.x, y: finish.y - cellSize * CGFloat(cell.stroke + 1))
            cell.circle.frame.origin = start
            
            UIView.animate(withDuration: 0.6) {
                cell.circle.frame.origin = finish
            }
        }
    }
    
    func pipCellAnimation() {
        if view.isKind(of: Cell.self) {
            let cell = view as! Cell
            let circle = cell.circle
            cell.circle.removeFromSuperview()
            cell.addSubview(circle)
            
            UIView.animate(withDuration: 1) {
                circle.frame.size = CGSize(width: circle.frame.size.width * 1.2, height: circle.frame.size.height * 1.2)
            }
            UIView.animate(withDuration: 2) {
                circle.frame.size = CGSize(width: circle.frame.size.width / 1.44, height: circle.frame.size.height / 1.44)
            }
            UIView.animate(withDuration: 3) {
                circle.frame.size = CGSize(width: circle.frame.size.width * 1.2, height: circle.frame.size.height * 1.2)
            }
        }
        
    }
    
    func pipDisapearAnimation() {
        if view.isKind(of: Cell.self) {
            let cell = view as! Cell
            UIView.animate(withDuration: 3) {
                cell.circle.color = .clear
            }
        }
    }
    
    func showUp() {
        self.view.alpha = 0.3
        UIView.animate(withDuration: 1) {
            self.view.alpha = 1
        }
    }
}
