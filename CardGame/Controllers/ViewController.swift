//
//  ViewController.swift
//  CardGame
//
//  Created by Amir Malamud on 04/04/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    //PlayerA
    @IBOutlet weak var PlayerA_img: UIImageView!
    @IBOutlet weak var PlayerA_Score: UILabel!
    
    //Main
    @IBOutlet weak var round_count: UILabel!
    @IBOutlet weak var PlayerA_Deak: UIImageView!
    @IBOutlet weak var PlayerB_Deak: UIImageView!
    @IBOutlet weak var btn_start: UIButton!
    
    //PlayerB
    @IBOutlet weak var PlayerB_img: UIImageView!
    @IBOutlet weak var PlayerB_Score: UILabel!
    
    //Data
    private let deakMengment =  Deak()
    private var scorePlayerA=0
    private var scorePlayerB=0
    private var round=0
    
    //Timer
    var timer = Timer()
    
    //audio
    var player: AVAudioPlayer!
    var flip = SoundPlayer(soundName: "flip", type: "mp3")
    var win = SoundPlayer(soundName: "win", type: "wav")

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        self.btn_start.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(gameRun) , userInfo: nil, repeats: true)
        
    }
    
    @objc func gameRun(){
        if(round<15)
        {
            playSound(sound: flip)
            updateUI()
        }
        else{
            timer.invalidate()
            playSound(sound: win)
            checkWin()
            Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(playAgain) , userInfo: nil, repeats: false)
            
        }
    }
    
    func updateUI(){
        updateDeaks()
        updateScore()
        updateIndex()
        updateRound()
    }
    
    func updateDeaks(){
        
        UIView.transition(with: PlayerA_Deak, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        PlayerA_Deak.image = deakMengment.deakPlayerA?[deakMengment.playerA_index].cardImg
        
        UIView.transition(with: PlayerB_Deak, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        PlayerB_Deak.image = deakMengment.deakPlayerB?[deakMengment.playerB_index].cardImg
    }
    

    func playSound(sound:SoundPlayer?){
        let url = Bundle.main.url(forResource: sound?.soundName, withExtension: sound?.type)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func updateScore(){
        if(deakMengment.deakPlayerA![deakMengment.playerA_index].cardPower > deakMengment.deakPlayerB![deakMengment.playerB_index].cardPower ){
            scorePlayerA+=1
            PlayerA_Score.text = "Player A:\(scorePlayerA)"

        }
        else  if(deakMengment.deakPlayerA![deakMengment.playerA_index].cardPower < deakMengment.deakPlayerB![deakMengment.playerB_index].cardPower ){
            scorePlayerB+=1
            PlayerB_Score.text = "Player B:\(scorePlayerB)"
        }
    }
    
    func updateIndex(){
        deakMengment.playerA_index+=1
        deakMengment.playerB_index+=1
        
    }
    
    func updateRound(){
        round+=1
        round_count.text = "\(round)/15"
        
    }
    func checkWin(){
        
        if(scorePlayerA>scorePlayerB){
            round_count.text = "PlayerA WON!!"
        }
        
        else if(scorePlayerA<scorePlayerB){
            round_count.text = "PlayerB WON!!"
        }
        else{
            round_count.text = "DROW!!"

        }
    }
    
    @objc func playAgain(){
        deakMengment.playAgain()
        scorePlayerA=0
        PlayerA_Score.text = "Player A:\(scorePlayerA)"
        scorePlayerB=0
        PlayerB_Score.text = "Player B:\(scorePlayerB)"
        round=0
        round_count.text = "\(round)/15"
        PlayerA_Deak.image = UIImage(named: "cardBack")
        PlayerB_Deak.image = UIImage(named: "cardBack")
        self.btn_start.isHidden = false
    }
    
}

