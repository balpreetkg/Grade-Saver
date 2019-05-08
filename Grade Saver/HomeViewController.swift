//
//  ViewController.swift
//  Grade Saver
//
//  Created by Balpreet on 2019-05-07.
//  Copyright © 2019 Ballu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func averageButtonPressed(_ sender: Any) {
        print("Button pressed")
        self.performSegue(withIdentifier: "AverageViewSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View has loaded :)")
        // ya
        // Do any additional setup after loading the view.
    }


}

