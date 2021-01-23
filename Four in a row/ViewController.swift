//
//  ViewController.swift
//  Four in a row
//
//  Created by Константин on 22.01.2021.
//

import UIKit

class ViewController: UIViewController {
    let circle = Circle(color: .yellow)
    let cell = Cell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        self.view.addSubview(cell)
        //self.cell.addSubview(circle)
        self.circle.frame.size = CGSize(width: 50, height: 50)
        
        
    }

    private func setupConstarints() {
        [
            cell,
            circle,
            
        ].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            cell.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cell.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            //circle.centerXAnchor.constraint(equalTo: self.cell.centerXAnchor),
            //circle.centerYAnchor.constraint(equalTo: self.circle.centerYAnchor),
            
            
            
        ].forEach{
            $0.isActive = true
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        setupConstarints()
    }
}

