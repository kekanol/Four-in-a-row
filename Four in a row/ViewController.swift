//
//  ViewController.swift
//  Four in a row
//
//  Created by Константин on 22.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    let circle = Circle(color: .yellow)
    let cell = Cell(stroke: 1, row: 1)
    let gameBoard = BoardGame()
    var tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        //self.view.addSubview(cell)
        //self.cell.insertSubview(circle, at: 0)
        self.view.addSubview(gameBoard)
        
    }

    private func setupConstarints() {
        [
           // cell,
           // circle,
            gameBoard,
        ].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            gameBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameBoard.widthAnchor.constraint(equalToConstant: cellSize*7),
            gameBoard.heightAnchor.constraint(equalToConstant: cellSize*6),
            gameBoard.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            
          //  cell.widthAnchor.constraint(equalToConstant: cellSize),
          //  cell.heightAnchor.constraint(equalTo: cell.widthAnchor),
          //  cell.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
          //  cell.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
          //  circle.centerXAnchor.constraint(equalTo: self.cell.centerXAnchor),
          //  circle.centerYAnchor.constraint(equalTo: self.cell.centerYAnchor),
          //  circle.widthAnchor.constraint(equalTo: cell.widthAnchor),
          //  circle.heightAnchor.constraint(equalTo: circle.widthAnchor),
          
            
            
        ].forEach{
            $0.isActive = true
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        setupConstarints()
    }
}

