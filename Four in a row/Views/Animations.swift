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
                circle.frame.origin = CGPoint(x: circle.frame.origin.x - circleSize * 0.05, y: circle.frame.origin.y - circleSize * 0.05)
                circle.frame.size = CGSize(width: circleSize * 1.1, height: circleSize * 1.1)
            }
            UIView.animate(withDuration: 2) {
                circle.frame.origin = CGPoint(x: circle.frame.origin.x + circleSize * 0.05, y: circle.frame.origin.y + circleSize * 0.05)
                circle.frame.size = CGSize(width: circleSize, height: circleSize)
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
    
    func spin() {
        print("spining animation")
    }
    
    func drawAnimation() {
        let start = view.frame.origin
        UIView.animate(withDuration: 0.25) {
            self.view.frame.origin = CGPoint(x: start.x, y: start.y - circleSize * 0.5)
        }
        UIView.animate(withDuration: 0.5) {
            self.view.frame.origin = CGPoint(x: start.x, y: start.y + circleSize * 0.5)
        }
        UIView.animate(withDuration: 0.75) {
            self.view.frame.origin = CGPoint(x: start.x - circleSize * 0.5 , y: start.y)
        }
        UIView.animate(withDuration: 1) {
            self.view.frame.origin = CGPoint(x: start.x + circleSize * 0.5 , y: start.y)
        }
        UIView.animate(withDuration: 1.25) {
            self.view.frame.origin = start
        }
    }
}
