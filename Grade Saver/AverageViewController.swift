//
//  AverageViewController.swift
//  Grade Saver
//
//  Created by Balpreet on 2019-05-07.
//  Copyright © 2019 Ballu. All rights reserved.
//

import UIKit

class AverageViewController: UIViewController {
    
    var averageString = ""
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "AverageToMainSegue", sender: self)
    }
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet var collection:[UITextField]!
    
    @IBOutlet weak var valueOfStepper: UIStepper!

    @IBAction func submitButtonPressed(_ sender: Any) {
        let calculatedAverage = tryCalculation()
        if calculatedAverage {
            self.performSegue(withIdentifier: "GiveAverageSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "GiveAverageSegue") {
            let vc = segue.destination as! GiveAverageViewController
            vc.average = self.averageString
        }
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
    
    func extractGrades(grades: [UITextField]) -> [Float] {
        var arrayOfGrades: [Float] = []
        for x in grades {
            if let text = x.text, !text.isEmpty {
                let flo = Float(text)!
                arrayOfGrades.append(flo)
            }
        }
        return arrayOfGrades
    }
    
    func tryCalculation() -> Bool {
        let grades = extractGrades(grades: collection)
        var total: Float = 0.0
        var amount = 0
        if grades.isEmpty {
            self.errorMessage.isHidden = false
            return false
        }
        for x in grades {
            if x > 150.0 {
                self.errorMessage.isHidden = false
                return false
            }
            total = total + x
            amount += 1
        }
        let average = total / Float(amount)
        print (String(average))
        self.averageString = String(format: "%.2f", average)
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for x in self.collection {
            x.keyboardType = UIKeyboardType.decimalPad
        }
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        // ya
        // Do any additional setup after loading the view.
    }
    
    
}
