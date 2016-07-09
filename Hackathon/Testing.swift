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
    private let questions: [Question] = []
    private var questionCount = 0
    var end = false
    var result = 0
    init(discipline: String, chapter: String){
        let questionsRef = FIRDatabase.database().reference().child("disciplins").child(discipline).child("glavs").child(chapter).child("questons")
        //incrementStarsForRef(postRef)
        questionsRef.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            // Get user value
            let username = snapshot.value!["username"] as! String
            //let user = User.init(username: username)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        //получить массив всех вопросов
        //вычислить максимальный индекс
        let maxIndex:UInt32 = 0
        for _ in 0...10 {
            var questionIndex:UInt32 = -1
            //while questionIndex =
            // пока индекс есть в уже полученных цикл
            questionIndex = arc4random_uniform(maxIndex)
            //questions.append(<#T##newElement: Question##Question#>)
            // положить в уже полученные
            
        }
    }
    func getNextQuestion(index: Int) -> Question{
        let question = questions[questionCount]
        questionCount += 1
        return question
    }
    func checkAnswer(questionIndex: Int, answer: Int) -> Bool{
        end = questionCount == 10
        if answer == questions[questionIndex].rightAnswer {
            result += 1
            return true
        } else {
            return false
        }
    }
    func
}
