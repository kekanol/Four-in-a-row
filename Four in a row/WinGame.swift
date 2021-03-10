//
//  WinGame.swift
//  Four in a row
//
//  Created by Константин on 08.03.2021.
//

import Foundation

final class WinGame {
    
    weak var boardGame: BoardGame?
    var winRow: [Cell] = []
    
    init(_ boardGame: BoardGame) {
        self.boardGame = boardGame
    }
    
    func checkWin() {
        var count = 0
        for row in boardGame!.cellArray {
            for cell in row {
                if !cell.isEmpty {
                    count += 1
                    if checkVertical(cell: cell) || checkHorizontal(cell: cell) || checktopDiag(cell: cell) || checkdownDiag(cell: cell) {
                        boardGame?.isGameWon = true
                        
                    }
                }
            }
        }
        if count == 42 {
            boardGame?.isDraw = true
        }
    }
    
    private func setWinRow(cell: Cell, right: Int, vertical: Int) {
        winRow.append(cell)
        winRow.append(boardGame!.cellArray[cell.row + right][cell.stroke + vertical])
        winRow.append(boardGame!.cellArray[cell.row + 2 * right][cell.stroke + 2 * vertical])
        winRow.append(boardGame!.cellArray[cell.row + 3 * right][cell.stroke + 3 * vertical])
    }
    
    private func checkHorizontal(cell: Cell) -> Bool {
        var count = 0
        if cell.row != 6 {
            var checkCell = cell
            while boardGame!.cellArray[checkCell.row + 1][checkCell.stroke].circle.color == checkCell.circle.color && boardGame!.cellArray[checkCell.row + 1][checkCell.stroke].isEmpty != true {
                count += 1
                checkCell = boardGame!.cellArray[checkCell.row + 1][checkCell.stroke]
                if checkCell.row == 6 {
                    break
                }
                if count == 3 {
                    break
                }
            }
            if count == 3 {
                setWinRow(cell: cell, right: 1, vertical: 0)
                return true
            } else {
                return false
            }
        } else {
        return false
        }
    }
    
    private func checkVertical(cell: Cell) -> Bool {
        var count = 0
        if cell.stroke != 5 {
            var checkCell = cell
            while boardGame!.cellArray[checkCell.row][checkCell.stroke + 1].circle.color == checkCell.circle.color && boardGame!.cellArray[checkCell.row][checkCell.stroke + 1].isEmpty != true {
                count += 1
                checkCell = boardGame!.cellArray[checkCell.row][checkCell.stroke + 1]
                if checkCell.stroke == 5 {
                    break
                }
                if count == 3 {
                    break
                }
            }
            if count == 3 {
                setWinRow(cell: cell, right: 0, vertical: 1)
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    private func checktopDiag(cell: Cell) -> Bool {
        var count = 0
        if cell.row != 6 && cell.stroke != 0 {
            var chekup = cell
            while boardGame!.cellArray[chekup.row + 1][chekup.stroke - 1].circle.color == chekup.circle.color && boardGame!.cellArray[chekup.row + 1][chekup.stroke - 1].isEmpty != true {
                count += 1
                chekup = boardGame!.cellArray[chekup.row + 1][chekup.stroke - 1]
                if chekup.row == 6 || chekup.stroke == 0 {
                    break
                }
                if count == 3 {
                    break
                }
            }
            if count == 3 {
                setWinRow(cell: cell, right: 1, vertical: -1)
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    private func checkdownDiag(cell: Cell) -> Bool {
        var count = 0
        if cell.row != 6 && cell.stroke != 5 {
            var chekdown = cell
            while boardGame!.cellArray[chekdown.row + 1][chekdown.stroke + 1].circle.color == chekdown.circle.color && boardGame!.cellArray[chekdown.row + 1][chekdown.stroke + 1].isEmpty != true {
                count += 1
                chekdown = boardGame!.cellArray[chekdown.row + 1][chekdown.stroke + 1]
                if chekdown.row == 6 || chekdown.stroke == 5 {
                    break
                }
                if count == 3 {
                    break
                }
            }
            if count == 3 {
                setWinRow(cell: cell, right: 1, vertical: 1)
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
