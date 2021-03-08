//
//  ViewController.swift
//  Four in a row
//
//  Created by Константин on 22.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    let gameBoard = BoardGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.view.addSubview(gameBoard)
        
    }
    
    private func setupConstarints() {
        
        gameBoard.translatesAutoresizingMaskIntoConstraints = false
        
        [
            gameBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameBoard.widthAnchor.constraint(equalToConstant: cellSize*7),
            gameBoard.heightAnchor.constraint(equalToConstant: cellSize*6),
            gameBoard.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
        ].forEach{
            $0.isActive = true
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        setupConstarints()
    }
}

