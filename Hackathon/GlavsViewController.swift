//
//  GlavsViewController.swift
//  Hackathon
//
//  Created by Emil Karimov on 10.07.16.
//  Copyright © 2016 Sergey Khlebnikov. All rights reserved.
//

import UIKit

class GlavsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let textForFirstTableView = ["Italian food", "Mexican food", "Croatian food", "Spanish food", "French food"]
    
    let namesOfFood = [["Bolognese", "Milagnese","Pizza"],
                       ["Tortilla", "Chimichanga", "Paella"],
                       ["Burek od mesa","Grah", "Janjetina"],
                       ["Tapas", "Churros", "Flan"],
                       ["Buche de Noel", "Cherry Cake", "Onion Soup"]]
    
    var ObjectNamesOfFood = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textForFirstTableView.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = textForFirstTableView[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.ObjectNamesOfFood = self.namesOfFood[indexPath.row]
        
        self.performSegueWithIdentifier("Segue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let glavs = segue.destinationViewController as! GlavsViewController
        
        var whatToPass = self.ObjectNamesOfFood
        
        
        
        
    }
}