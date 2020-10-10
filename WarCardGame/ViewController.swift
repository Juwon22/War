//
//  ViewController.swift
//  WarCardGame
//
//  Created by Olajuwon Adeola on 10/3/20.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var dealButton: UIButton!
    @IBOutlet weak var cpuScoreLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var cpuCard: UIImageView!
    @IBOutlet weak var playerCard: UIImageView!
    var playerScore: Int = 0
    var cpuScore: Int = 0
    
    var playerDeck: [Card] = []
    var cpuDeck: [Card] = []
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.playerCard.image = UIImage(named: "blue_back")
        self.cpuCard.image = UIImage(named: "red_back")
        self.dealButton.setTitle("DEAL", for: .normal)
        playerDeck = createDeck()
        cpuDeck = playerDeck
        playerDeck.shuffle()
        cpuDeck.shuffle()
        
        self.updateScoreUI()
        
    }
    
    
    // MARK: TODO: Modify deck sizes after dealing card
    // MARK: TODO: Implement actual game rules xD
    // MARK: TODO: Game over logic
    
    func generateRandomNumber(sizeofDeck: Int) -> Int {
        return Int.random(in: 0..<sizeofDeck)
    }


    @IBAction func dealButtonTapped(_ sender: Any) {
        var playerWonRound: Bool
        
        let playerCardIndex = generateRandomNumber(sizeofDeck: playerDeck.count)
        let cpuCardIndex = generateRandomNumber(sizeofDeck: cpuDeck.count)

        let playerCardDrawn: Card = playerDeck[playerCardIndex]
        let cpuCardDrawn: Card = playerDeck[cpuCardIndex]
        
       updateCardsUI(playerCardDrawn: playerCardDrawn, cpuCardDrawn: cpuCardDrawn)
        
        if playerCardDrawn.rank.rawValue > cpuCardDrawn.rank.rawValue {
            playerWonRound = true
        }
        else {
            playerWonRound = false
        }
        self.updateScore(playerWonRound: playerWonRound)
        
    }
    
    func getCardAsset(with card: Card) -> UIImage {
        var cardString = String(card.rank.rawValue)
        switch card.suit {
        case .Clover:
            cardString += "C"
        case .Diamond:
            cardString += "D"
        case .Heart:
            cardString += "H"
        case .Spade:
            cardString += "S"
        }
      
        return UIImage.init(named: cardString)!
    }

    func updateCardsUI(playerCardDrawn card1: Card, cpuCardDrawn card2: Card) {
        
        playerCard.image = getCardAsset(with: card1)
        cpuCard.image = getCardAsset(with: card2)
        
    }
    
    func updateScore(playerWonRound: Bool){
        if playerWonRound {
            self.playerScore += 1
        }
        else {
            self.cpuScore += 1
        }
        updateScoreUI()
    }
    
    func generateCards(){
        
    }
    
    func updateScoreUI() {
        self.playerScoreLabel.text = String(self.playerScore)
        self.cpuScoreLabel.text = String(self.cpuScore)
        
    }
    
    
    
}





