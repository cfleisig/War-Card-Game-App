//
//  ViewController.swift
//  Fleisig_Clara_cardWar
//
//  Created by Period One on 2017-10-24.
//  Copyright © 2017 Period One. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

override func viewDidLoad() {
    super.viewDidLoad()

//Runs shuffleRoutine and hides newGame button when app is oppened
    newGame.isHidden = true
    winnerMessage.isHidden = true
    shuffleRoutine()
    }

//Creates outlets
@IBOutlet weak var playerOneCard: UIImageView!
@IBOutlet weak var playerTwoCard: UIImageView!
@IBOutlet weak var newGame: UIButton!
@IBOutlet weak var drawCard: UIButton!
@IBOutlet weak var player1score: UILabel!
@IBOutlet weak var player2score: UILabel!
@IBOutlet weak var tieCard1: UIImageView!
@IBOutlet weak var tieCard2: UIImageView!
@IBOutlet weak var tieCard3: UIImageView!
@IBOutlet weak var tieCard4: UIImageView!
@IBOutlet weak var tieCard5: UIImageView!
@IBOutlet weak var tieCard6: UIImageView!
@IBOutlet weak var tiePlayerOneCard: UIImageView!
@IBOutlet weak var tiePlayerTwoCard: UIImageView!
@IBOutlet weak var winnerMessage: UILabel!
    
//Stores variables
var shuffledDeck: [UIImage] = []
var sortedDeck: [UIImage] = [ #imageLiteral(resourceName: "2_of_clubs.png"),#imageLiteral(resourceName: "2_of_diamonds.png"),#imageLiteral(resourceName: "2_of_hearts.png"),#imageLiteral(resourceName: "2_of_spades.png"),#imageLiteral(resourceName: "3_of_clubs.png"),#imageLiteral(resourceName: "3_of_diamonds.png"),#imageLiteral(resourceName: "3_of_spades.png"),#imageLiteral(resourceName: "3_of_hearts"),#imageLiteral(resourceName: "4_of_clubs.png"),#imageLiteral(resourceName: "4_of_diamonds.png"),#imageLiteral(resourceName: "4_of_hearts.png"),#imageLiteral(resourceName: "4_of_spades.png"),#imageLiteral(resourceName: "5_of_clubs.png"),#imageLiteral(resourceName: "5_of_diamonds.png"),#imageLiteral(resourceName: "5_of_hearts.png"),#imageLiteral(resourceName: "5_of_spades.png"),#imageLiteral(resourceName: "6_of_clubs.png"),#imageLiteral(resourceName: "6_of_diamonds.png"),#imageLiteral(resourceName: "6_of_hearts.png"),#imageLiteral(resourceName: "6_of_spades.png"),#imageLiteral(resourceName: "7_of_clubs.png"),#imageLiteral(resourceName: "7_of_diamonds.png"),#imageLiteral(resourceName: "7_of_hearts.png"),#imageLiteral(resourceName: "7_of_spades.png"),#imageLiteral(resourceName: "8_of_clubs.png"),#imageLiteral(resourceName: "8_of_diamonds.png"),#imageLiteral(resourceName: "8_of_hearts.png"),#imageLiteral(resourceName: "8_of_spades.png"),#imageLiteral(resourceName: "9_of_clubs.png"),#imageLiteral(resourceName: "9_of_diamonds.png"),#imageLiteral(resourceName: "9_of_hearts.png"),#imageLiteral(resourceName: "9_of_spades.png"),#imageLiteral(resourceName: "10_of_clubs.png"),#imageLiteral(resourceName: "10_of_diamonds.png"),#imageLiteral(resourceName: "10_of_hearts.png"),#imageLiteral(resourceName: "10_of_spades.png"),#imageLiteral(resourceName: "ace_of_clubs.png"),#imageLiteral(resourceName: "ace_of_diamonds.png"),#imageLiteral(resourceName: "ace_of_hearts.png"),#imageLiteral(resourceName: "ace_of_spades.png"),#imageLiteral(resourceName: "jack_of_clubs.png"),#imageLiteral(resourceName: "jack_of_diamonds.png"),#imageLiteral(resourceName: "jack_of_hearts.png"),#imageLiteral(resourceName: "jack_of_spades.png"),#imageLiteral(resourceName: "queen_of_spades.png"),#imageLiteral(resourceName: "queen_of_hearts.png"),#imageLiteral(resourceName: "queen_of_diamonds.png"),#imageLiteral(resourceName: "queen_of_clubs.png"),#imageLiteral(resourceName: "king_of_spades.png"),#imageLiteral(resourceName: "king_of_hearts.png"),#imageLiteral(resourceName: "king_of_diamonds.png"),#imageLiteral(resourceName: "king_of_clubs.png")]
var upperLimit: UInt32 = 52
var randomlyGeneratedNumber = 0
var switchCardPointValue = #imageLiteral(resourceName: "download.jpg")
var playerOneCardPointValue = 0
var playerTwoCardPointValue = 0
var playerOneScoreCount = 0
var playerTwoScoreCount = 0
var tempStorage = 0
 
//function shuffles cards when called
func shuffleRoutine() {
    //Puts cards from sortedDeck array in a random order into shuffledDeck array
    for _ in 1...52 {
        randomlyGeneratedNumber = Int((arc4random_uniform(upperLimit)))
        shuffledDeck.append(sortedDeck[randomlyGeneratedNumber])
        sortedDeck.remove(at: randomlyGeneratedNumber)
        upperLimit -= 1
    }
    
    //resets variables and sorted deck to what they were before for loop executed, so they are ready to run shuffle routine again
    upperLimit = 52
    sortedDeck = [ #imageLiteral(resourceName: "2_of_clubs.png"),#imageLiteral(resourceName: "2_of_diamonds.png"),#imageLiteral(resourceName: "2_of_hearts.png"),#imageLiteral(resourceName: "2_of_spades.png"),#imageLiteral(resourceName: "3_of_clubs.png"),#imageLiteral(resourceName: "3_of_diamonds.png"),#imageLiteral(resourceName: "3_of_spades.png"),#imageLiteral(resourceName: "3_of_hearts"),#imageLiteral(resourceName: "4_of_clubs.png"),#imageLiteral(resourceName: "4_of_diamonds.png"),#imageLiteral(resourceName: "4_of_hearts.png"),#imageLiteral(resourceName: "4_of_spades.png"),#imageLiteral(resourceName: "5_of_clubs.png"),#imageLiteral(resourceName: "5_of_diamonds.png"),#imageLiteral(resourceName: "5_of_hearts.png"),#imageLiteral(resourceName: "5_of_spades.png"),#imageLiteral(resourceName: "6_of_clubs.png"),#imageLiteral(resourceName: "6_of_diamonds.png"),#imageLiteral(resourceName: "6_of_hearts.png"),#imageLiteral(resourceName: "6_of_spades.png"),#imageLiteral(resourceName: "7_of_clubs.png"),#imageLiteral(resourceName: "7_of_diamonds.png"),#imageLiteral(resourceName: "7_of_hearts.png"),#imageLiteral(resourceName: "7_of_spades.png"),#imageLiteral(resourceName: "8_of_clubs.png"),#imageLiteral(resourceName: "8_of_diamonds.png"),#imageLiteral(resourceName: "8_of_hearts.png"),#imageLiteral(resourceName: "8_of_spades.png"),#imageLiteral(resourceName: "9_of_clubs.png"),#imageLiteral(resourceName: "9_of_diamonds.png"),#imageLiteral(resourceName: "9_of_hearts.png"),#imageLiteral(resourceName: "9_of_spades.png"),#imageLiteral(resourceName: "10_of_clubs.png"),#imageLiteral(resourceName: "10_of_diamonds.png"),#imageLiteral(resourceName: "10_of_hearts.png"),#imageLiteral(resourceName: "10_of_spades.png"),#imageLiteral(resourceName: "ace_of_clubs.png"),#imageLiteral(resourceName: "ace_of_diamonds.png"),#imageLiteral(resourceName: "ace_of_hearts.png"),#imageLiteral(resourceName: "ace_of_spades.png"),#imageLiteral(resourceName: "jack_of_clubs.png"),#imageLiteral(resourceName: "jack_of_diamonds.png"),#imageLiteral(resourceName: "jack_of_hearts.png"),#imageLiteral(resourceName: "jack_of_spades.png"),#imageLiteral(resourceName: "queen_of_spades.png"),#imageLiteral(resourceName: "queen_of_hearts.png"),#imageLiteral(resourceName: "queen_of_diamonds.png"),#imageLiteral(resourceName: "queen_of_clubs.png"),#imageLiteral(resourceName: "king_of_spades.png"),#imageLiteral(resourceName: "king_of_hearts.png"),#imageLiteral(resourceName: "king_of_diamonds.png"),#imageLiteral(resourceName: "king_of_clubs.png")]
    }

//function assigns card values to cards when called
func CardValue(_ card: UIImage) {
    switch card {
        case #imageLiteral(resourceName: "ace_of_clubs"),#imageLiteral(resourceName: "ace_of_hearts"),#imageLiteral(resourceName: "ace_of_spades"),#imageLiteral(resourceName: "ace_of_diamonds"):
            tempStorage = 1
        case #imageLiteral(resourceName: "2_of_clubs.png"),#imageLiteral(resourceName: "2_of_diamonds.png"),#imageLiteral(resourceName: "2_of_hearts.png"),#imageLiteral(resourceName: "2_of_spades.png"):
            tempStorage = 2
        case #imageLiteral(resourceName: "3_of_clubs.png"),#imageLiteral(resourceName: "3_of_diamonds.png"),#imageLiteral(resourceName: "3_of_hearts.png"),#imageLiteral(resourceName: "3_of_spades.png"):
            tempStorage = 3
        case #imageLiteral(resourceName: "4_of_clubs.png"),#imageLiteral(resourceName: "4_of_diamonds.png"),#imageLiteral(resourceName: "4_of_hearts.png"),#imageLiteral(resourceName: "4_of_spades.png"):
            tempStorage = 4
        case #imageLiteral(resourceName: "5_of_clubs.png"),#imageLiteral(resourceName: "5_of_diamonds.png"),#imageLiteral(resourceName: "5_of_hearts.png"),#imageLiteral(resourceName: "5_of_spades.png"):
            tempStorage = 5
        case #imageLiteral(resourceName: "6_of_clubs.png"),#imageLiteral(resourceName: "6_of_diamonds.png"),#imageLiteral(resourceName: "6_of_hearts.png"),#imageLiteral(resourceName: "6_of_spades.png"):
            tempStorage = 6
        case #imageLiteral(resourceName: "7_of_clubs.png"),#imageLiteral(resourceName: "7_of_diamonds.png"),#imageLiteral(resourceName: "7_of_hearts.png"),#imageLiteral(resourceName: "7_of_spades.png"):
            tempStorage = 7
        case #imageLiteral(resourceName: "8_of_clubs.png"),#imageLiteral(resourceName: "8_of_diamonds.png"),#imageLiteral(resourceName: "8_of_hearts.png"),#imageLiteral(resourceName: "8_of_spades.png"):
            tempStorage = 8
        case #imageLiteral(resourceName: "9_of_clubs.png"),#imageLiteral(resourceName: "9_of_diamonds.png"),#imageLiteral(resourceName: "9_of_hearts.png"),#imageLiteral(resourceName: "9_of_spades.png"):
            tempStorage = 9
        case #imageLiteral(resourceName: "10_of_clubs.png"),#imageLiteral(resourceName: "10_of_diamonds.png"),#imageLiteral(resourceName: "10_of_hearts.png"),#imageLiteral(resourceName: "10_of_spades.png"):
            tempStorage = 10
        case #imageLiteral(resourceName: "jack_of_clubs.png"),#imageLiteral(resourceName: "jack_of_diamonds.png"),#imageLiteral(resourceName: "jack_of_hearts.png"),#imageLiteral(resourceName: "jack_of_spades.png"):
            tempStorage = 11
        case #imageLiteral(resourceName: "queen_of_clubs.png"),#imageLiteral(resourceName: "queen_of_diamonds.png"),#imageLiteral(resourceName: "queen_of_hearts.png"),#imageLiteral(resourceName: "queen_of_spades.png"):
            tempStorage = 12
        default:
            tempStorage = 13
        }
    }
    
//function scores when called upon
func scoring(){
    //assigns playerOneCardPointValue playerOneCard's value
    CardValue(playerOneCard.image!)
    playerOneCardPointValue = tempStorage
    
    //assigns playerTwoCardPointValue playerTwoCard's value
    CardValue(playerTwoCard.image!)
    playerTwoCardPointValue = tempStorage
        
    //gives player One two points if they have the higher card
    if playerOneCardPointValue > playerTwoCardPointValue {
        playerOneScoreCount += 2
        player1score.text = "\(playerOneScoreCount) pts."
            
    //gives player two two points if they have the higher card
    } else if playerOneCardPointValue < playerTwoCardPointValue {
        playerTwoScoreCount += 2
        player2score.text = "\(playerTwoScoreCount) pts."
            
    //executes bonus assignment code if the cards have the same amount of points
    } else if playerOneCardPointValue == playerTwoCardPointValue && shuffledDeck.count >= 5 {
        //puts cards a card from shuffledDeck into tiePlayerOneCard
        tiePlayerOneCard.image = shuffledDeck [0]
        shuffledDeck.remove(at: 0)
            
        //puts cards a card from shuffledDeck into tiePlayerOneCard
        tiePlayerTwoCard.image = shuffledDeck [0]
        shuffledDeck.remove(at: 0)
            
        //puts cards a card from shuffledDeck into tieCard1
        tieCard1.image = shuffledDeck [0]
        shuffledDeck.remove(at: 0)
            
        //puts cards a card from shuffledDeck into tieCard2
        tieCard2.image = shuffledDeck [0]
        shuffledDeck.remove(at: 0)
            
        //puts cards a card from shuffledDeck into tieCard3
        tieCard3.image = shuffledDeck [0]
        shuffledDeck.remove(at: 0)
            
        //puts cards a card from shuffledDeck into tieCard4
        tieCard4.image = shuffledDeck [0]
        shuffledDeck.remove(at: 0)
            
        //puts cards a card from shuffledDeck into tieCard5
        tieCard5.image = shuffledDeck [0]
        shuffledDeck.remove(at: 0)
            
        //puts cards a card from shuffledDeck into tieCard6
        tieCard6.image = shuffledDeck [0]
        shuffledDeck.remove(at: 0)
            
        //assigns playerOneCardPointValue tiePlayerOneCard's value
        CardValue(tiePlayerOneCard.image!)
        playerOneCardPointValue = tempStorage
        
        //assigns playerTwoCardPointValue tiePlayerTwoCard's value
        CardValue(tiePlayerTwoCard.image!)
        playerTwoCardPointValue = tempStorage
            
        //gives player one ten points if they have the higher tie breaking card
        if playerOneCardPointValue > playerTwoCardPointValue {
            playerOneScoreCount += 10
            player1score.text = "\(playerOneScoreCount) pts."
        
        //gives player two two points if they have the higher tie breaking card
        } else if playerOneCardPointValue < playerTwoCardPointValue {
            playerTwoScoreCount += 10
            player2score.text = "\(playerTwoScoreCount) pts."
        
        //gives both player 5 points if they tie again
        } else {
            playerOneScoreCount += 5
            player1score.text = "\(playerOneScoreCount) pts."
            playerTwoScoreCount += 5
            player2score.text = "\(playerTwoScoreCount) pts."
            }
    
    //gives eachplayer 1 point if they tie but do not have enough cards to execute Bonus assignement code
    } else {
        playerOneScoreCount += 1
        player1score.text = "\(playerOneScoreCount) pts."
        playerTwoScoreCount += 1
        player2score.text = "\(playerTwoScoreCount) pts."
        }
 }
    
//Resets game when newGame button is pressed
@IBAction func newGame(_ sender: Any) {
    //shows the back of all the cards again
    playerOneCard.image = #imageLiteral(resourceName: "download")
    playerTwoCard.image = #imageLiteral(resourceName: "download")
    tiePlayerOneCard.image = #imageLiteral(resourceName: "download.jpg")
    tiePlayerTwoCard.image = #imageLiteral(resourceName: "download.jpg")
    tieCard1.image = #imageLiteral(resourceName: "download.jpg")
    tieCard2.image = #imageLiteral(resourceName: "download.jpg")
    tieCard3.image = #imageLiteral(resourceName: "download.jpg")
    tieCard4.image = #imageLiteral(resourceName: "download.jpg")
    tieCard5.image = #imageLiteral(resourceName: "download.jpg")
    tieCard6.image = #imageLiteral(resourceName: "download.jpg")
    
    //resets scores
    playerOneScoreCount = 0
    playerTwoScoreCount = 0
    player1score.text = "\(playerOneScoreCount) pts."
    player2score.text = "\(playerTwoScoreCount) pts."
    
    //hides winnerMessage and only gives the user the option to press drawCard button
    newGame.isHidden = true
    drawCard.isHidden = false
    winnerMessage.isHidden = true
    
    //creates a brand new shuffledDeck array
    shuffledDeck.removeAll()
    shuffleRoutine()
    }
    
//draws card when drawCard button is pressed
@IBAction func drawCard(_ sender: Any) {
    //gives users the option to start a new game
    newGame.isHidden = false
    
    //shows back of tie cards
    tiePlayerOneCard.image = #imageLiteral(resourceName: "download.jpg")
    tiePlayerTwoCard.image = #imageLiteral(resourceName: "download.jpg")
    tieCard1.image = #imageLiteral(resourceName: "download.jpg")
    tieCard2.image = #imageLiteral(resourceName: "download.jpg")
    tieCard3.image = #imageLiteral(resourceName: "download.jpg")
    tieCard4.image = #imageLiteral(resourceName: "download.jpg")
    tieCard5.image = #imageLiteral(resourceName: "download.jpg")
    tieCard6.image = #imageLiteral(resourceName: "download.jpg")
    
    //puts cards a card from shuffledDeck into playerOneCard
    playerOneCard.image = shuffledDeck [0]

    shuffledDeck.remove(at: 0)
    
    //puts cards a card from shuffledDeck into playerTwoCard
    playerTwoCard.image = shuffledDeck [0]
    shuffledDeck.remove(at: 0)
    
    //calls scoring function
    scoring()
    
    //ends game if their are no more cards to draw from shuffledDeck array
    if shuffledDeck.isEmpty {
        //does not allow user to draw a card
        drawCard.isHidden = true
        
        //announces the winner in winnerMessage
        winnerMessage.isHidden = false
        if playerOneScoreCount > playerTwoScoreCount {
            winnerMessage.text = "Player 1 Won!"
        } else if playerOneScoreCount < playerTwoScoreCount {
            winnerMessage.text = "Player 2 Won!"
        } else {
            winnerMessage.text = "It was a Tie!"
        }
    }
}
    
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
