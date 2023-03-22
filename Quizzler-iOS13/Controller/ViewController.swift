//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var ChoiceSecondButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var rightAnswer: UILabel!
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
        let correctAnswer = quizBrain.whichIsCorrectAnswer()
        
        if userGotItRight {
           sender.backgroundColor = UIColor.green
            rightAnswer.text = "Great is the correct answer!"
        }else{
            rightAnswer.text = "The correct answer was: \(correctAnswer)"
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
      
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        let answerChoices = quizBrain.getAnswers()
        
        choiceOneButton.setTitle(answerChoices[0], for: .normal)
        ChoiceSecondButton.setTitle(answerChoices[1], for: .normal)
        choiceThreeButton.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        labelScore.text = "Score: \(quizBrain.getStore())"
        rightAnswer.text = "Waiting your answer..."
        
        choiceOneButton.backgroundColor = UIColor.clear
        ChoiceSecondButton.backgroundColor = UIColor.clear
        choiceThreeButton.backgroundColor = UIColor.clear
       
    }
}

