//
//  ViewController.swift
//  Quizzler
//
//  Created by Анастасия Ларина on 28.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
   var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    @IBAction func answearButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
       
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()

        let answerChoices = quizBrain.getAnswers()
        button1.setTitle(answerChoices[0], for: .normal)
        button2.setTitle(answerChoices[1], for: .normal)
        button3.setTitle(answerChoices[2], for: .normal)
        
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = ("Score: \(quizBrain.getScore())")
        
           
        button1.backgroundColor = UIColor.clear
        button2.backgroundColor = UIColor.clear
        button3.backgroundColor = UIColor.clear
        
    }
        
}

