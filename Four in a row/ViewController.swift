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
    let cancelButton = CancelButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.view.addSubview(gameBoard)
        self.view.addSubview(restartButton)
        restartButton.addTarget(gameBoard, action: #selector(gameBoard.restart), for: .touchUpInside)
        self.view.addSubview(cancelButton)
        cancelButton.addTarget(gameBoard, action: #selector(gameBoard.cancel), for: .touchUpInside)
    }
    
    private func setupConstarints() {
        
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        gameBoard.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        [
            
            gameBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameBoard.widthAnchor.constraint(equalToConstant: cellSize*7),
            gameBoard.heightAnchor.constraint(equalToConstant: cellSize*6),
            gameBoard.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            restartButton.topAnchor.constraint(equalTo: gameBoard.bottomAnchor, constant: 20),
            restartButton.centerXAnchor.constraint(equalTo: gameBoard.centerXAnchor),
            restartButton.widthAnchor.constraint(equalToConstant: 80),
            restartButton.heightAnchor.constraint(equalTo: restartButton.widthAnchor, multiplier: 0.9),
            
            cancelButton.topAnchor.constraint(equalTo: restartButton.topAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: gameBoard.leadingAnchor),
            cancelButton.widthAnchor.constraint(equalTo: restartButton.widthAnchor),
            cancelButton.heightAnchor.constraint(equalTo: restartButton.heightAnchor),
            
        ].forEach{
            $0.isActive = true
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        setupConstarints()
    }
}

