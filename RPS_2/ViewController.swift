//
//  ViewController.swift
//  RPS_2
//
//  Created by James Chun on 11/25/18.
//  Copyright © 2018 James Chun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var playerSign: UISegmentedControl!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var rockPaperScissor: [RockPaperScissor] = [
        RockPaperScissor(emoji: Sign.rock.emoji,        value: Sign.rock.value,        sign: .rock),
        RockPaperScissor(emoji: Sign.paper.emoji,        value: Sign.paper.value,    sign: .paper),
        RockPaperScissor(emoji: Sign.scissors.emoji,     value: Sign.scissors.value,    sign: .scissors)
    ]
    
    var lastResult: GameState = .start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigationController!.title = "Debugging"
        // Do any additional setup after loading the view, typically from a nib.
        updateView()
    }

    @IBAction func pickSign(_ sender: Any) {
        let i: Int = playerSign!.selectedSegmentIndex; //Find out which segment was pressed.
        let currentRPS: RockPaperScissor = rockPaperScissor[i]
        playerSign!.removeAllSegments()
        playerSign!.insertSegment(withTitle: currentRPS.emoji, at: 1, animated: false)
        
        play(myTurn: currentRPS.sign)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        lastResult = .start
        playerSign.isEnabled = true
        
        updateView()
    }
    
    func initView() {
        let font: UIFont = UIFont.systemFont(ofSize: 70);
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]; //a dictionary
        playerSign!.setTitleTextAttributes(attributes, for: UIControl.State.normal);
        
        //FIXME: why doens't this work?
        //playerSign!.layer.borderColor = UIColor.clear.cgColor
        
        //Put the animals into the segmented control.
        playerSign!.removeAllSegments();
        for rps in rockPaperScissor {
            playerSign!.insertSegment(withTitle: rps.emoji, at: rockPaperScissor.count, animated: false)
        }
        //When the app is launched, no segment is selected yet.
        playerSign!.selectedSegmentIndex = -1
    }
    
    func updateView() {
        status.text = lastResult.message
        
        view.backgroundColor = lastResult.backgroundColor
        
        
        if lastResult == .start {
            appSign.text = "🤖"
            playAgainButton.isHidden = true
            initView()
        }
        
    }
    
    func play(myTurn: Sign) {
        let appTurn: Sign = randomSign()
        lastResult = myTurn.compare(opponentSign: appTurn)
        updateView()
        
        appSign.text = appTurn.emoji
        playerSign.isEnabled = false
        playAgainButton.isHidden = false
    }
    
}

