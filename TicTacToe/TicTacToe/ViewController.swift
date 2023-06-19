//
//  ViewController.swift
//  TicTacToe
//
//  Created by Deepanshu Gautam on 11/06/23.
//

import UIKit

class ViewController: UIViewController {
    enum Turn {
        case Nought
        case Cross
    }
    var currntTurn = Turn.Cross
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        turnLabel.text = CROSS
    }
    
    var NOUGHT = "O"
    var CROSS = "X"
    var movesCount = 0
    
    @IBAction func boardTap(_ sender: UIButton) {
        if(sender.title(for: .normal) == nil) {
            movesCount += 1
            if(currntTurn==Turn.Cross) {
                sender.setTitle(CROSS, for: .normal)
                if checkWin(currntTurn) {
                    turnLabel.text = CROSS + " WINS!!"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.resetBoard()
                    }
                } else {
                    currntTurn = Turn.Nought
                    turnLabel.text = NOUGHT
                }
            } else if(currntTurn == Turn.Nought) {
                sender.setTitle(NOUGHT, for: .normal)
                if checkWin(currntTurn) {
                    turnLabel.text = NOUGHT + " WINS!!"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.resetBoard()
                    }
                } else {
                    currntTurn = Turn.Cross
                    turnLabel.text = CROSS
                }
                
            }
            if(movesCount==9) {
                turnLabel.text = "DRAW!!"
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.resetBoard()
                }
            }
        }
    }
    
    func resetBoard() -> Void {
        for b in buttons {
            b.setTitle(nil, for: .normal)
        }
        turnLabel.text = CROSS
        currntTurn = Turn.Cross
        movesCount = 0
    }
    func checkWin(_ turn: Turn) -> Bool {
        var res:String = ""
        for i in (0..<3) {
            res = ""
            for j in (0..<3) {
                if let val = buttons[3*i+j].currentTitle {
                    res = res + val
                }
            }
            if (res == "XXX" && currntTurn==Turn.Cross) {
                return true
            }
            if (res == "OOO" && currntTurn==Turn.Nought) {
                return true
            }
        }
        for j in (0..<3) {
            res = ""
            for i in (0..<3) {
                if let val = buttons[3*i+j].currentTitle {
                    res = res + val
                }
            }
            if (res == "XXX" && currntTurn==Turn.Cross) {
                return true
            }
            if (res == "OOO" && currntTurn==Turn.Nought) {
                return true
            }
        }
        res = ""
        for i in (0..<3) {
            if let val = buttons[3*i+i].currentTitle {
                res = res + val
            }
        }
        if (res == "XXX" && currntTurn==Turn.Cross) {
            return true
        }
        if (res == "OOO" && currntTurn==Turn.Nought) {
            return true
        }
        res = ""
        for (i, j) in zip((0..<3), (0..<3).reversed()) {
            if let val = buttons[3*i+j].currentTitle {
                res = res + val
            }
        }
        if (res == "XXX" && currntTurn==Turn.Cross) {
            return true
        }
        if (res == "OOO" && currntTurn==Turn.Nought) {
            return true
        }
        return false
    }
}

