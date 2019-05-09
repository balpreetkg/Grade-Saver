//
//  AverageViewController.swift
//  Grade Saver
//
//  Created by Balpreet on 2019-05-07.
//  Copyright © 2019 Ballu. All rights reserved.
//

import UIKit

class AverageViewController: UIViewController {
    
    @IBOutlet var collection:[UIView]!
    
    @IBOutlet weak var valueOfStepper: UIStepper!
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "GiveAverageSegue", sender: self)
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        var tracker = 1
        print(valueOfStepper.value)
        for x in self.collection {
            if Int(valueOfStepper.value) >= tracker {
                x.isHidden = false
                tracker += 1
            } else {
                x.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ya
        // Do any additional setup after loading the view.
    }
    
    
}
