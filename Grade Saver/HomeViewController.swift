//
//  ViewController.swift
//  Grade Saver
//
//  Created by Balpreet on 2019-05-07.
//  Copyright © 2019 Ballu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func motivationButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "MotivationViewSegue", sender: self)
    }
    
    @IBAction func currentGradeButtonPressed(_ sender: Any) {
        print ("Current Grade Button Pressed")
        self.performSegue(withIdentifier: "CurrentGradeSegue", sender: self)
    }
    
    @IBAction func finalMarkButtonPressed(_ sender: Any) {
        print ("Final Mark Button Pressed")
        self.performSegue(withIdentifier: "FinalMarkSegue", sender: self)
    }
    
    @IBAction func averageButtonPressed(_ sender: Any) {
        print("Average Button pressed")
        self.performSegue(withIdentifier: "AverageViewSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View has loaded :)")
        // ya
        // Do any additional setup after loading the view.
    }


}

