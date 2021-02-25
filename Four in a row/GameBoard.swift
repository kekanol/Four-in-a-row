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
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    func setupUI() {
        
        for x in 0...widthCount {
            cellArray.append([])
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
        
        if lastCell.isColored {
            lastCell = makeCell(lastCell)
        } else {
            lastCell = colorCell(lastCell)
        }
        cellArray[lastCell.row][lastCell.stroke] = lastCell
        draw()
    }
    
    
    private func makeCell(_ cell: Cell) -> Cell {
        colorRowOf(cell, in: .clear)
        let circle = Circle(color: .yellow)
        circle.frame = cell.bounds
        cell.insertSubview(circle, at: 0)
        cell.isEmpty = false
        return cell
    }
    
    
    private func colorCell(_ cell: Cell) -> Cell {
        cellArray.forEach { row in
            row.forEach { cell in
                cell.isColored = false
                cell.preCircle.color = .clear
            }
        }
        colorRowOf(cell, in: UIColor.black.withAlphaComponent(0.5))
        cell.preCircle.color = UIColor.yellow.withAlphaComponent(0.7)
        cell.isColored = true
        return cell
    }
    
    private func colorRowOf(_ cell: Cell, in color: UIColor) {
        cellArray[cell.row].forEach { rowCell in
            if rowCell.isEmpty{
                rowCell.preCircle.color = color
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
