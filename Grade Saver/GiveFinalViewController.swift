//
//  GiveFinalViewController.swift
//  Grade Saver
//
//  Created by Balpreet on 2019-05-13.
//  Copyright © 2019 Ballu. All rights reserved.
//

import UIKit

class GiveFinalViewController: UIViewController {
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    var markNeededOnFinal = ""

    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "GiveFinalToFinalSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        percentageLabel.text = markNeededOnFinal + "%"
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
