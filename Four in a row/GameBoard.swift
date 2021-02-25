//
//  GameBoard.swift
//  Four in a row
//
//  Created by Константин on 19.02.2021.
//

import UIKit


final class BoardGame: UIView {
    
    let widthCount: Int = 6
    let heightCount: Int = 5
    
    var cellArray: [[Cell]] = []
    var preCellArray : [Cell] = []
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    func setupUI() {
        for x in 0...widthCount {
            cellArray.append([])
            let preCell = Cell(row: x, isPrecell: true)
            preCell.isPreCell = true
            preCellArray.append(preCell)
            for y in 0...heightCount {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.setCell(_:)))
                let cell = Cell(stroke: y, row: x)
                tapGesture.numberOfTapsRequired = 1
                tapGesture.numberOfTouchesRequired = 1
                cell.addGestureRecognizer(tapGesture)
                cell.isUserInteractionEnabled = true
                cell.tag = 6 * x + y + 1
                cellArray[x].append(cell)
            }
        }
        self.draw()
    }
   
    
    @objc func setCell(_ sender: UITapGestureRecognizer) {
        let checked = sender.view as! Cell
        var lastCell = findLastCell(cell: checked)
        if lastCell.stroke == 0 && lastCell.isEmpty == false {
            self.springOnTop(of: lastCell)
        } else {
            if lastCell.isColored {
                lastCell = makeCell(lastCell)
            } else {
                lastCell = colorCell(lastCell)
            }
            cellArray[lastCell.row][lastCell.stroke] = lastCell
        }
        draw()
    }
    
    private func springOnTop(of lastCell: Cell) {
        clearBoard()
        let animatingCell = preCellArray[lastCell.row]
        animatingCell.isColored = true
        animatingCell.circle.color = .yellow
        Animation(with: animatingCell).springAnimation()
    }
    
    private func makeCell(_ cell: Cell) -> Cell {
        colorRowOf(cell, in: .clear)
        preCellArray[cell.row].isColored = false
        preCellArray[cell.row].circle.color = .clear
        cell.circle.color = .yellow
        Animation(with: cell.circle).goDownAnimation(of: cell)
        cell.isEmpty = false
        return cell
    }
    
    
    private func colorCell(_ cell: Cell) -> Cell {
        self.clearBoard()
        preCellArray[cell.row].isColored = true
        preCellArray[cell.row].circle.color = UIColor.yellow.withAlphaComponent(1)
        colorRowOf(cell, in: UIColor.black.withAlphaComponent(0.5))
        cell.circle.color = UIColor.yellow.withAlphaComponent(0.7)
        cell.isColored = true
        return cell
    }
    
    private func clearBoard() {
        cellArray.forEach { row in
            preCellArray[row.first?.row ?? row.count - 1].isColored = false
            preCellArray[row.first?.row ?? row.count - 1].circle.color = .clear
            row.forEach { cell in
                if cell.isEmpty {
                    cell.isColored = false
                    cell.circle.color = .clear
                }
            }
        }
    }
    
    private func colorRowOf(_ cell: Cell, in color: UIColor) {
        cellArray[cell.row].forEach { rowCell in
            if rowCell.isEmpty{
                rowCell.circle.color = color
            }
        }
    }
    
    private func findLastCell(cell: Cell) -> Cell {
        var checked = cell
        while check(cell: checked) == true {
            if checked.stroke == 5 {
                break
            } else {
                let newChecked = cellArray[checked.row][checked.stroke + 1]
                checked = newChecked
            }
        }
        while check(cell: checked) == false {
            if checked.stroke == 0 {
                break
            } else {
                let newChecked = cellArray[checked.row][checked.stroke - 1]
                checked = newChecked
            }
        }
        return checked
    }
    
    
    private func check(cell: Cell) -> Bool {
        return cellArray[cell.row][cell.stroke].isEmpty
    }
    
    
    func draw() {
        
        for sub in self.subviews {
            sub.removeFromSuperview()
        }
        
        for cell in preCellArray {
            rasstavit(cell)
        }
        
        for row in cellArray {
            for element in row {
                rasstavit(element)
            }
        }
    }
    
    
    private func rasstavit(_ cell: Cell) {
        self.addSubview(cell)
        cell.frame.origin = CGPoint(x: cellSize * CGFloat(cell.row), y: cellSize * CGFloat(cell.stroke))
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
