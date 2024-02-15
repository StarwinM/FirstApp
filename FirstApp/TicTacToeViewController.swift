//
//  TicTacToeViewController.swift
//  FirstApp
//
//  Created by Мирас Джанин on 25.03.2023.
//

import UIKit

class TicTacToeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet var labelWinner: UILabel!
    var winnerMas = [[0,3,6],[1,4,7],[2,5,8],[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6]]
    
    @IBOutlet var buttons: [UIButton]!
    var player = 0
    @IBAction func clickButton(_ sender: UIButton) {
        player += 1
        if player % 2 == 0 {
            sender.setTitle("⭕️", for: .normal)
            sender.isEnabled = false
        }
        else {
            sender.setTitle("❌", for: .normal)
            sender.isEnabled = false
        }
        var xArray:[Int] = []
        var oArray:[Int] = []
        for i in 0...8 {
            if buttons[i].title(for: .normal) == "❌" {
                xArray.append(i)
            }
            if buttons[i].title(for: .normal) == "⭕️" {
                oArray.append(i)
            }
        }
        
        for i in 0...7 {
            if xArray.contains(winnerMas[i][0]) && xArray.contains(winnerMas[i][1]) && xArray.contains(winnerMas[i][2]) {
                labelWinner.text = "Winner is ❌"
                for j in 0...8{
                    buttons[j].isEnabled = false
                }
            }
                if oArray.contains(winnerMas[i][0]) && oArray.contains(winnerMas[i][1]) && oArray.contains(winnerMas[i][2]) {
                    labelWinner.text = "Winner is ⭕️"
                    for j in 0...8{
                        buttons[j].isEnabled = false
                    }
                }
            }

//        if buttons[0].title(for: .normal) == buttons[3].title(for: .normal) && buttons[3].title(for: .normal) == buttons[6].title(for: .normal) && buttons[0].title(for: .normal) != nil && buttons[0].title(for: .normal) != ""
//        {
//
//        }
    }
}
