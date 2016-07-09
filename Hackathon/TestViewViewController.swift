//
//  TestViewViewController.swift
//  Hackathon
//
//  Created by Sergey Khlebnikov on 09.07.16.
//  Copyright © 2016 Sergey Khlebnikov. All rights reserved.
//

import UIKit
import Firebase


class TestViewViewController: UIViewController {

    @IBOutlet var imageField: UIImageView!
    @IBOutlet var questionText: UITextView!
    
    @IBAction func answer1(sender: AnyObject) {
        checkAnswer(1)
    }
    @IBAction func answer2(sender: AnyObject) {
        checkAnswer(2)
    }
    @IBAction func answer3(sender: AnyObject) {
        checkAnswer(3)
    }
    @IBAction func answer4(sender: AnyObject) {
        checkAnswer(4)
    }
    @IBOutlet var answer1: UIButton!
    @IBOutlet var answer2: UIButton!
    @IBOutlet var answer3: UIButton!
    @IBOutlet var answer4: UIButton!
    
    var testing:Testing!
    var chapter:String?
    var discipline:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if chapter != nil {
            testing = Testing(discipline: discipline, chapter: chapter!)
        }else{
            testing = Testing(discipline: discipline)
        }
        getNextQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getNextQuestion(){
        let question = testing.getNextQuestion()
        questionText.text = question.text
        answer1.setTitle(question.answer1, forState: UIControlState.Normal)
        answer2.setTitle(question.answer2, forState: UIControlState.Normal)
        answer3.setTitle(question.answer3, forState: UIControlState.Normal)
        answer4.setTitle(question.answer4, forState: UIControlState.Normal)
    }
    
    func checkAnswer(answerId:Int){
        testing.checkAnswer(answerId)
        if testing.end {
            performSegueWithIdentifier("resultView", sender: self)
        } else {
            getNextQuestion()
        }
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destinationViewController as? ResultViewController{
            destinationViewController.result = testing.result
            destinationViewController.discipline = discipline
            destinationViewController.chapter = chapter
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   

}
