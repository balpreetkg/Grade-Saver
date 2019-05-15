//
//  MotivationViewController.swift
//  Grade Saver
//
//  Created by Balpreet on 2019-05-07.
//  Copyright © 2019 Ballu. All rights reserved.
//

import UIKit

class MotivationViewController: UIViewController {
    
    let quotes = ["You can and you will!", "Do not get lazy, do it now!", "Work with determination, and you'll wake with satisfaction.", "When you lose your excuses, you'll find your results.", "Don't be afraid to fail, be afraid to not try!", "Your only roadblock is yourself!", "Strive for progress, not perfection.", "Stop wishing, start doing!", "You are your only limit.", "In order to succeed, you must first believe that you can!"]
    
    @IBOutlet weak var motivationalQuote: UILabel!
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "MotivationToMainSegue", sender: self)
    }
    
    @IBAction func refreshQuote(_ sender: UIButton) {
        let lastIndexOfQuotes = quotes.count - 1
        let number = Int.random(in: 0...lastIndexOfQuotes)
        self.motivationalQuote.text = quotes[number]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lastIndexOfQuotes = quotes.count - 1
        let number = Int.random(in: 0...lastIndexOfQuotes)
        self.motivationalQuote.text = quotes[number]
        // ya
        // Do any additional setup after loading the view.
    }
    
    
}
