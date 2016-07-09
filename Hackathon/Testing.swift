//
//  Testing.swift
//  Hackathon
//
//  Created by Sergey Khlebnikov on 09.07.16.
//  Copyright © 2016 Sergey Khlebnikov. All rights reserved.
//

import Foundation
import Firebase

struct Question{
    let text: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
    let rightAnswer: Int
}

class Testing {
    var end = false
    var result = 0
    private var questions: [Question] = []
    private var questionCount = -1
    init(discipline: String, chapter: String){
        var maxIndex:UInt32?
        let questionsRef = FIRDatabase.database().reference().child("disciplins").child(discipline).child("glavs").child(chapter).child("questons")
        //incrementStarsForRef(postRef)
        questionsRef.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            maxIndex = UInt32(snapshot.childrenCount)
            for _ in 0...10 {
                var strQuestionIndex:String! = " "
                var questionsSet = Set<String>()
                repeat {
                    strQuestionIndex = String(arc4random_uniform(maxIndex!))
                    let questionSnapshot = snapshot.childSnapshotForPath(strQuestionIndex)
                    let text = questionSnapshot.value!["text"] as! String
                    let answer1 = questionSnapshot.value!["answer1"] as! String
                    let answer2 = questionSnapshot.value!["answer2"] as! String
                    let answer3 = questionSnapshot.value!["answer3"] as! String
                    let answer4 = questionSnapshot.value!["answer4"] as! String
                    let rightAnswer = questionSnapshot.value!["rightAnswer"] as! Int
                    let question = Question(text: text, answer1: answer1, answer2: answer2, answer3: answer3, answer4: answer4, rightAnswer: rightAnswer)
                    self.questions.append(question)
                    questionsSet.insert(strQuestionIndex)
                    
                } while questionsSet.contains(strQuestionIndex)
            }
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    func getNextQuestion() -> Question{
        questionCount += 1
        return questions[questionCount]
    }
    func checkAnswer(answer: Int) -> Bool{
        end = questionCount == 10
        if answer == questions[questionCount].rightAnswer {
            result += 1
            return true
        } else {
            return false
        }
    }
}
