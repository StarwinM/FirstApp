//
//  ViewController.swift
//  FirstApp
//
//  Created by Мирас Джанин on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emoji1.shuffle()
        gameOver.isHidden = true
    }
    
    @IBOutlet var gameOver: UIImageView!
    @IBOutlet var score: UILabel!
    var scoreCounter = 0
    @IBAction func restart(_ sender: UIButton) {
        for i in 0...11 {
            flipButtons[i].backgroundColor = .black
            flipButtons[i].isEnabled = true
            flipButtons[i].setTitle("", for: .normal)
        }
        emoji1.shuffle()
        scoreCounter = 0
        score.text = "Счёт: 0"
        gameOver.isHidden = true
    }
    var emoji1 = ["🐢","🐍","🦋","🦀","🐬","🐳","🐢","🐍","🦋","🦀","🐬","🐳"]
    
    @IBOutlet var flipButtons: [UIButton]!
    @IBOutlet weak var flipButton1: UIButton!
    func flipButton(emoji:String, sender:UIButton)
    {
        if sender.backgroundColor == .black {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.01) {
                sender.backgroundColor = .orange
                sender.setTitle(emoji, for: .normal)
                sender.titleLabel?.bounds = CGRect(x: sender.bounds.origin.x - 10, y: sender.bounds.height - 10, width: sender.bounds.width + 20, height: 0)
            }
        }
        else {
            sender.backgroundColor = .black
            sender.setTitle("", for: .normal)
        }
    }
    
    @IBAction func flip(_ sender: UIButton) {
        let index = flipButtons.firstIndex(of: sender)!
        flipButton(emoji: emoji1[index], sender: sender)
        scoreCounter += 1
        score.text = "Счёт: \(scoreCounter)"
        if scoreCounter == 30{
            for i in 0...11{
                flipButtons[i].isEnabled = false
                flipButtons[i].backgroundColor = .clear
            }
            gameOver.isHidden = false
        }
        var counter:[Int] = []
        for i in 0...flipButtons.count-1
        {
            if flipButtons[i].backgroundColor == .orange
            {
                counter.append(i)
            }
        }
        if counter.count == 2 {
            if flipButtons[counter[0]].title(for: .normal) == flipButtons[counter[1]].title(for: .normal)
            {
                flipButtons[counter[0]].backgroundColor = .clear
                flipButtons[counter[1]].backgroundColor = .clear
                flipButtons[counter[0]].setTitle("", for: .normal)
                flipButtons[counter[1]].setTitle("", for: .normal)
                flipButtons[counter[0]].isEnabled = false
                flipButtons[counter[1]].isEnabled = false
                
            }
        }
        else if counter.count  < 2 {
            
        }
        else {
            for i in counter {
                if flipButtons[i] != sender{
                    flipButton(emoji: "", sender: flipButtons[i])
                }
            }
        }
    }
}

