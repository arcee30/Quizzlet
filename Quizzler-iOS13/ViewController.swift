//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
var i : Int = 1

class ViewController: UIViewController {
    
    @IBOutlet weak var False: UIButton!
    @IBOutlet weak var True: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var bar: UIProgressView!
    @IBOutlet weak var score: UILabel!
    
    
    @IBOutlet weak var progressLabel: UIProgressView!
    
    let quiz = [["Light Yagami was an aimless killer","F"],["College essays require thought to write","T"], ["Forza Horizon 4 can teach you basic supply and demand econ theory","T"], ["Aali's a smart desi","F"], ["No pain no substantial gain", "T"],["Congrats, you have finished the quiz! Your score is displayed above","N"]]
   
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let original = self.True.backgroundColor
        let interval = Float(1.0/Double(quiz.count - 1))
       self.progressLabel.progress += interval
        if i < quiz.count {
            self.questionLabel.text = quiz[i][0]
        
        
        
     
        
        
        if sender.currentTitle == "True" && quiz[i-1][1] == "T"{
            print("Correct!")
            switch self.score.text! {
            case "Score:0": self.score.text! = "Score:1"
            case "Score:1": self.score.text! = "Score:2"
            case "Score:2": self.score.text! = "Score:3"
            case "Score:3": self.score.text! = "Score:4"
            case "Score:4": self.score.text! = "Score:5"
            default: print("Error")
            }
            
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                
                self.True.backgroundColor = UIColor.green
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
                self.True.backgroundColor = original
            }
          
            
            
        } else if sender.currentTitle == "False" && quiz[i-1][1] == "F" {
            print("Correct!")
            switch self.score.text! {
            case "Score:0": self.score.text! = "Score:1"
            case "Score:1": self.score.text! = "Score:2"
            case "Score:2": self.score.text! = "Score:3"
            case "Score:3": self.score.text! = "Score:4"
            case "Score:4": self.score.text! = "Score:5"
            default: print("Error")
            }
         
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                
                self.False.backgroundColor = UIColor.green
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
                self.False.backgroundColor = original
            }
            
            
        } else if sender.currentTitle == "False" && quiz[i-1][1] == "T" {
            print("Wrong!")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                
                self.False.backgroundColor = UIColor.red
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
                self.False.backgroundColor = original
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                
                self.True.backgroundColor = UIColor.red
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
                self.True.backgroundColor = original
            }
            
           
        }
        
        }
        
     i+=1
      
        if self.progressLabel.progress == 1 {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                
                i = 1
                self.questionLabel.text = self.quiz[0][0]
                self.progressLabel.progress = 0
                self.score.text = "Score: 0"
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.questionLabel.text = quiz[0][0]
        self.progressLabel.progress = 0
      
    }


}

