//
//  ViewController.swift
//  Four in a row
//
//  Created by Константин on 22.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let gameBoard = BoardGame()
    let restartButton = RestartButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.view.addSubview(gameBoard)
        self.view.addSubview(restartButton)
        restartButton.addTarget(gameBoard, action: #selector(gameBoard.restart), for: .touchUpInside)
    }
    
    private func setupConstarints() {
        
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        gameBoard.translatesAutoresizingMaskIntoConstraints = false
        
        [
            gameBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameBoard.widthAnchor.constraint(equalToConstant: cellSize*7),
            gameBoard.heightAnchor.constraint(equalToConstant: cellSize*6),
            gameBoard.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            restartButton.topAnchor.constraint(equalTo: gameBoard.bottomAnchor, constant: 20),
            restartButton.centerXAnchor.constraint(equalTo: gameBoard.centerXAnchor),
            restartButton.widthAnchor.constraint(equalToConstant: 80),
            restartButton.heightAnchor.constraint(equalTo: restartButton.widthAnchor, multiplier: 0.9)
            
        ].forEach{
            $0.isActive = true
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        setupConstarints()
    }
}

