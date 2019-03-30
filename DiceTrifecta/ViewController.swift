//
//  ViewController.swift
//  DiceTrifecta
//
//  Created by Robert Lent on 3/28/19.
//  Copyright © 2019 Lent Coding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dice1View: UIImageView!
    @IBOutlet weak var dice2View: UIImageView!
    @IBOutlet weak var dice3View: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    var dice1 = 6
    var dice2 = 6
    var dice3 = 6
    var score = 0
    var highScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newGame()
    }
    
    @IBAction func newGameButton(_ sender: Any) {
        newGame()
    }
    
    @IBAction func clearHighScore(_ sender: Any) {
        highScore = 0
        defaults.set(0, forKey: "highScore")
        highScoreLabel.text = "High Score: \(highScore)"
    }
    
    func newGame() {
        score = 0
        highScore = defaults.integer(forKey: "highScore")
        
        scoreLabel.text = "Score: \(score)"
        highScoreLabel.text = "High Score: \(highScore)"
        
        dice1View.image = UIImage(named: "dice-6")
        dice2View.image = UIImage(named: "dice-6")
        dice3View.image = UIImage(named: "dice-6")
    }
    
    func updateScore(points: Int) {
        score += points
        scoreLabel.text = "Score: \(score)"
        
        if score > highScore {
            highScore = score
            defaults.set(highScore, forKey: "highScore")
            highScoreLabel.text = "High Score: \(highScore)"
        }
    }

    @IBAction func rollDice(_ sender: Any) {
        dice1 = Int.random(in: 1...6)
        dice2 = Int.random(in: 1...6)
        dice3 = Int.random(in: 1...6)
        
        dice1View.image = UIImage(named: "dice-\(dice1)")
        dice2View.image = UIImage(named: "dice-\(dice2)")
        dice3View.image = UIImage(named: "dice-\(dice3)")
        
        if dice1 == dice2 && dice1 == dice3 {
            updateScore(points: 100 * dice1)
        } else if dice1 == dice2 || dice1 == dice3 || dice2 == dice3 {
            updateScore(points: 50)
        }
    }
}

