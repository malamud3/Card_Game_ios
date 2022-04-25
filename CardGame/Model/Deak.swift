//
//  controller_deak.swift
//  CardGame
//
//  Created by Amir Malamud on 13/04/2022.
//

import Foundation
import UIKit


class Deak {
    
     private var cards:[CARD]? = []
     var deakPlayerA: ArraySlice<CARD>?
     var deakPlayerB: ArraySlice<CARD>?
     var playerA_index = 0
     var playerB_index = 0
    
    init() {
        initCardsArray()
        suffleCards()
        initDeaks()
        initDeaksIndex()
    }
    
    private func initCardsArray(){
        self.cards =
        [
            //2
            CARD(power: 2, img: UIImage(named: "2_of_clubs")! ), //clubs
            CARD(power: 2, img: UIImage(named: "2_of_diamonds")! ), //diamonds
            CARD(power: 2, img: UIImage(named: "2_of_hearts")! ), //hearts
            CARD(power: 2, img: UIImage(named: "2_of_spades")! ), //spades

            //3
            CARD(power: 3, img: UIImage(named: "3_of_clubs")! ), //clubs
            CARD(power: 3, img: UIImage(named: "3_of_diamonds")! ), //diamonds
            CARD(power: 3, img: UIImage(named: "3_of_hearts")! ), //hearts
            CARD(power: 3, img: UIImage(named: "3_of_spades")! ), //spades

            //4
            CARD(power: 4, img: UIImage(named: "4_of_clubs")! ), //clubs
            CARD(power: 4, img: UIImage(named: "4_of_diamonds")! ), //diamonds
            CARD(power: 4, img: UIImage(named: "4_of_hearts")! ), //hearts
            CARD(power: 4, img: UIImage(named: "4_of_spades")! ), //spades

            //5
            CARD(power: 5, img: UIImage(named: "5_of_clubs")! ), //clubs
            CARD(power: 5, img: UIImage(named: "5_of_diamonds")! ), //diamonds
            CARD(power: 5, img: UIImage(named: "5_of_hearts")! ), //hearts
            CARD(power: 5, img: UIImage(named: "5_of_spades")! ), //spades

            //6
            CARD(power: 6, img: UIImage(named: "6_of_clubs")! ), //clubs
            CARD(power: 6, img: UIImage(named: "6_of_diamonds")! ), //diamonds
            CARD(power: 6, img: UIImage(named: "6_of_hearts")! ), //hearts
            CARD(power: 6, img: UIImage(named: "6_of_spades")! ), //spades

            //7
            CARD(power: 7, img: UIImage(named: "7_of_clubs")! ), //clubs
            CARD(power: 7, img: UIImage(named: "7_of_diamonds")! ), //diamonds
            CARD(power: 7, img: UIImage(named: "7_of_hearts")! ), //hearts
            CARD(power: 7, img: UIImage(named: "7_of_spades")! ), //spades

            //8
            CARD(power: 8, img: UIImage(named: "8_of_clubs")! ), //clubs
            CARD(power: 8, img: UIImage(named: "8_of_diamonds")! ), //diamonds
            CARD(power: 8, img: UIImage(named: "8_of_hearts")! ), //hearts
            CARD(power: 8, img: UIImage(named: "8_of_spades")! ), //spades

            //9
            CARD(power: 9, img: UIImage(named: "9_of_clubs")! ), //clubs
            CARD(power: 9, img: UIImage(named: "9_of_diamonds")! ), //diamonds
            CARD(power: 9, img: UIImage(named: "9_of_hearts")! ), //hearts
            CARD(power: 9, img: UIImage(named: "9_of_spades")! ), //spades

            //10
            CARD(power: 10,img: UIImage(named: "10_of_clubs")! ), //clubs
            CARD(power: 10,img: UIImage(named: "10_of_diamonds")! ), //diamonds
            CARD(power: 10,img: UIImage(named: "10_of_hearts")! ), //hearts
            CARD(power: 10,img: UIImage(named: "10_of_spades")! ), //spades

            //J
            CARD(power: 11,img: UIImage(named: "jack_of_clubs")! ), //clubs
            CARD(power: 11,img: UIImage(named: "jack_of_diamonds")! ),//diamonds
            CARD(power: 11,img: UIImage(named: "jack_of_hearts")! ), //hearts
            CARD(power: 11,img: UIImage(named: "jack_of_spades")! ), //spades

            //Q
            CARD(power: 12,img: UIImage(named: "queen_of_clubs")! ), //clubs
            CARD(power: 12,img: UIImage(named: "queen_of_diamonds")! ), //diamonds
            CARD(power: 12,img: UIImage(named: "queen_of_hearts")! ), //hearts
            CARD(power: 12,img: UIImage(named: "queen_of_spades")! ), //spades

            //K
            CARD(power: 13,img: UIImage(named: "king_of_clubs")! ), //clubs
            CARD(power: 13,img: UIImage(named: "king_of_diamonds")! ), //diamonds
            CARD(power: 13,img: UIImage(named: "king_of_hearts")! ), //hearts
            CARD(power: 13,img: UIImage(named: "king_of_spades")! ), //spades

            //A
            CARD(power: 14,img: UIImage(named: "ace_of_clubs")! ), //clubs
            CARD(power: 14,img: UIImage(named: "ace_of_diamonds")! ), //diamonds
            CARD(power: 14,img: UIImage(named: "ace_of_hearts")! ), //hearts
            CARD(power: 14,img: UIImage(named: "ace_of_spades")! ), //spades
        ]
    }
    
    private func initDeaks() {
        self.deakPlayerA = self.cards?.dropFirst(((self.cards!.count)/2))
        self.deakPlayerB = self.cards?.dropLast((self.cards!.count)/2+1)
        
    }
    
    private func initDeaksIndex() {

        playerA_index = self.deakPlayerA!.startIndex
        playerB_index = self.deakPlayerB!.startIndex
    
    }
    private func suffleCards() {
        self.cards?.shuffle()
    }
    
     func playAgain() {
        suffleCards()
        initDeaks()
        initDeaksIndex()
    }
}
