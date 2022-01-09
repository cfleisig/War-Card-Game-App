# War-Card-Game-App
This IOS app allows the user to play "war", a simple cardgame I often played as a child by implementing funcitonal buttons, a scoring and a simple shuffle routine.

## Required software to run App
* XCode 9, IOS 11

## How to run the app
1. Downlaod and unzip the War-Card-Game-App folder. 
2. Select `Fleisig_Clara_memoryGame.xcodeproj`, this should open the app in XCode
3. To simulate app, press on the `play` button on top left of , alternatively you may download app to a compatible iOS device

## How to play
1. Select `New game`
2. Each player is now allocated half of the cards in the deck, where the cards are randomly shuffled.
3. Press `Draw card`
    * If player1 has a higher card than player2, player one gets 2 pts.
    * If player2 has a higher card than player1, player two gets 2 pts.
    * If there is a tie, two more cards are drawn and the player which wins the second round gets 10 pts. If there is a second tie than both players get 5 pts. If there are not enough cards left in the deck for both players to draw another card, than both players are awarded 1pt.
4. Once the deck is empty, the player with the highest points wins, as indicated by a message on screen
5. Play agian!

## How to modify the app
To modify funcitonality, modify swift code in `ViewController.swift`

To modify UI elements, modify `Main.storyboard.xml`If
