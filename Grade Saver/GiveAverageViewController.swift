//
//  GiveAverageViewController.swift
//  Grade Saver
//
//  Created by Balpreet on 2019-05-10.
//  Copyright © 2019 Ballu. All rights reserved.
//

import UIKit

class GiveAverageViewController: UIViewController {

    @IBOutlet weak var averageLabel: UILabel!
    
    var average = ""
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "ReturnToAverageSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        averageLabel.text = average + "%"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
