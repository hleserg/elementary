//
//  ChoiseViewController.swift
//  Hackathon
//
//  Created by Emil Karimov on 10.07.16.
//  Copyright © 2016 Sergey Khlebnikov. All rights reserved.
//

import UIKit

var choosen = 0

class ChoiseViewController: UIViewController {
    
    @IBOutlet weak var choosenSubject: UIButton!
    
    
    @IBAction func buttonsAction(sender: AnyObject) {
        
        choosen = choosenSubject.tag
        print("choosenTag: \(choosenSubject.tag)")
        print("choosen: \(choosen)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.tabBarController?.tabBar.hidden = true
//       choosen = choosenSubject.tag
        
        
    }

}
