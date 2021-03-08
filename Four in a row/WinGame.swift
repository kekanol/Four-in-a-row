//
//  WinGame.swift
//  Four in a row
//
//  Created by Константин on 08.03.2021.
//

import Foundation

class WinGame {
    
    var boardGame: BoardGame
    var isGameWon: Bool = false
    
    init(_ boardGame: BoardGame) {
        self.boardGame = boardGame
    }
    
    func checkWin() {
        for row in boardGame.cellArray {
            for cell in row {
                if !cell.isEmpty {
                    if checkVertical(cell: cell) == 3 || checkHorizontal(cell: cell) == 3 || checktopDiag(cell: cell) == 3 || checkdownDiag(cell: cell) == 3 {
                        isGameWon = true
                        print("win \(cell.circle.color)")
                    }
                }
            }
        }
    }
    
    func checkHorizontal(cell: Cell) -> Int {
        var count = 0
        if cell.row != 6 {
            var checkCell = cell
            while boardGame.cellArray[checkCell.row + 1][checkCell.stroke].circle.color == checkCell.circle.color {
                count += 1
                checkCell = boardGame.cellArray[checkCell.row + 1][checkCell.stroke]
                if checkCell.row == 6 {
                    break
                }
                if count == 3 {
                    break
                }
            }
        }
        return count
    }
    
    
    
    func checkVertical(cell: Cell) -> Int {
        var count = 0
        if cell.stroke != 5 {
            var checkCell = cell
            while boardGame.cellArray[checkCell.row][checkCell.stroke + 1].circle.color == checkCell.circle.color  {
                count += 1
                checkCell = boardGame.cellArray[checkCell.row][checkCell.stroke + 1]
                if checkCell.stroke == 5 {
                    break
                }
                if count == 3 {
                    break
                }
            }
        }
        return count
    }
    
    func checktopDiag(cell: Cell) -> Int {
        var count = 0
        if cell.row != 6 && cell.stroke != 0 {
            var chekup = cell
            while boardGame.cellArray[chekup.row + 1][chekup.stroke - 1].circle.color == chekup.circle.color {
                count += 1
                chekup = boardGame.cellArray[chekup.row + 1][chekup.stroke - 1]
                if chekup.row == 6 || chekup.stroke == 0 {
                    break
                }
                if count == 3 {
                    break
                }
            }
        }
        return count
    }
    
    func checkdownDiag(cell: Cell) -> Int {
        var count = 0
        if cell.row != 6 && cell.stroke != 5 {
            var chekdown = cell
            
            while boardGame.cellArray[chekdown.row + 1][chekdown.stroke + 1].circle.color == chekdown.circle.color {
                count += 1
                chekdown = boardGame.cellArray[chekdown.row + 1][chekdown.stroke + 1]
                if chekdown.row == 6 || chekdown.stroke == 5 {
                    break
                }
                if count == 3 {
                    break
                }
            }
        }
        return count
    }
}
