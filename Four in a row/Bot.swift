//
//  Bot.swift
//  Four in a row
//
//  Created by Константин on 14.03.2021.
//

import UIKit

final class Bot {
    static let shared = Bot()
    var cellArray: [[Cell]] = []
    var movesArray: [Cell] = []
    var botIsFirst: Bool = false
    var yourCells: [Cell] = []
    var playerCells: [Cell] = []
    
    
    private func analize() {
        
    }

    private func findYourCells() {
        
        for row in cellArray {
            for cell in row {
                if botIsFirst {
                    if cell.circle.color == .yellow {
                        yourCells.append(cell)
                    } else if cell.circle.color == .red {
                        playerCells.append(cell)
                    }
                } else {
                    if cell.circle.color == .red {
                        yourCells.append(cell)
                    } else if cell.circle.color == .yellow {
                        playerCells.append(cell)
                    }
                }
            }
        }
    }
}
