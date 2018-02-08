//
//  ViewController.swift
//  Concentration
//
//  Created by Jelly Slather on 1/29/18.
//  Copyright © 2018 Rudinski. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
   
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0{
        didSet{
             flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var pointTotal = 0{
        didSet{
            pointTotalLabel.text = "Points: \(pointTotal)"
        }
    }
    

    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var pointTotalLabel: UILabel!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else{
            print("Chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
    }

    }
    
    var emojiChoices = ["🎃", "👻", "🍬", "🍭", "🦇", "🍎", "🙀"]
    var emojiChoices1 = ["🐶", "🐱", "🦊", "🐼", "🐨", "🐷", "🐧"]
    var emojiChoices2 = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏓"]
    var emojiChoices3 = ["🍏", "🍇", "🍊", "🍋", "🍌", "🍉", "🍓"]
    var emojiChoices4 = ["🎻", "🎺", "🎸", "🎤", "🎹", "🥁", "🎷"]
    var emojiChoices5 = ["❄️", "⛄️", "⛸", "🌨", "☂️", "🌪", "🏙"]
    
    //var emojiChoicesMaster = [0: emojiChoices, 1: emojiChoices1]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
        
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
            return emoji[card.identifier] ?? "?"
        
    }
    
}

