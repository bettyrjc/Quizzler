//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    var quizBrain = QuizBrain()

    @IBOutlet weak var labelScore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let  userGotItRight = quizBrain.checkAnswer(userAnswer!)
    
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
      
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        labelScore.text = "Score: \(quizBrain.getStore())"
    }
}

