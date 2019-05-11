//
//  CurrentGradeController.swift
//  Grade Saver
//
//  Created by Balpreet on 2019-05-07.
//  Copyright © 2019 Ballu. All rights reserved.
//

import UIKit

class CurrentGradeController: UIViewController {
    
    var currentGrade: Float = 0.0
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "CurrentGradeToMainSegue", sender: self)
    }
    
    @IBOutlet weak var currentGradeLabel: UILabel!
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBOutlet weak var border: UILabel!
    
    @IBOutlet var weights:[UITextField]!
    
    @IBOutlet var grades:[UITextField]!
    
    @IBOutlet var addButtons:[UIButton]!
    
    @IBAction func oneRowAdd(_ sender: UIButton) {
        grades[1].isHidden = false
        weights[1].isHidden = false
        addButtons[1].isHidden = false
    }
    
    @IBAction func twoRowAdd(_ sender: UIButton) {
        grades[2].isHidden = false
        weights[2].isHidden = false
        addButtons[2].isHidden = false
    }
    
    @IBAction func threeRowAdd(_ sender: UIButton) {
        grades[3].isHidden = false
        weights[3].isHidden = false
        addButtons[3].isHidden = false
    }
    
    @IBAction func fourRowAdd(_ sender: UIButton) {
        grades[4].isHidden = false
        weights[4].isHidden = false
        addButtons[4].isHidden = false
    }
    
    @IBAction func fiveRowAdd(_ sender: UIButton) {
        grades[5].isHidden = false
        weights[5].isHidden = false
        addButtons[5].isHidden = false
    }
    
    @IBAction func sixRowAdd(_ sender: UIButton) {
        grades[6].isHidden = false
        weights[6].isHidden = false
        addButtons[6].isHidden = false
    }
    
    @IBAction func sevenRowAdd(_ sender: UIButton) {
        grades[7].isHidden = false
        weights[7].isHidden = false
        addButtons[7].isHidden = false
    }
    
    @IBAction func eightRowAdd(_ sender: UIButton) {
        grades[8].isHidden = false
        weights[8].isHidden = false
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        if checkEmptyTextField() && tryCalculation() {
            self.percentageLabel.textColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            self.percentageLabel.text = String(format: "%.2f", currentGrade)
            self.percentageLabel.isHidden = false
            self.currentGradeLabel.textColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            self.currentGradeLabel.text = "your current grade is:"
            self.currentGradeLabel.isHidden = false
            self.border.isHidden = false
        }
    }
    
    func checkEmptyTextField() -> Bool {
        let sizeOfArray = weights.count - 1
        for i in 1...sizeOfArray {
            if let gradeText = grades[i].text, !gradeText.isEmpty {
                if let emptyWeight = weights[i].text, emptyWeight.isEmpty {
                    errorLabel()
                    return false
                }
            } else if let weightText = weights[i].text, !weightText.isEmpty {
                if let emptyGrade = grades[i].text, emptyGrade.isEmpty {
                    errorLabel()
                    return false
                }
            }
        }
        return true
    }
    
    func extractFloats(textFields: [UITextField]) -> [Float] {
        var arrayOfFloats: [Float] = []
        for x in textFields {
            if let text = x.text, !text.isEmpty {
                let flo = Float(text)!
                arrayOfFloats.append(flo)
            }
        }
        return arrayOfFloats
    }
    
    func errorLabel() {
        self.currentGradeLabel.isHidden = true
        self.border.isHidden = true
        self.percentageLabel.textColor = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        self.percentageLabel.text = "ERROR"
        self.percentageLabel.isHidden = false
    }
    
    func tryCalculation() -> Bool {
        let gradeFloats = extractFloats(textFields: grades)
        let weightFloats = extractFloats(textFields: weights)
        var totalPercentage: Float = 0.0
        var currentGradeTotal: Float = 0.0
        if gradeFloats.isEmpty || weightFloats.isEmpty {
            errorLabel()
            return false
        }
        for i in 0...(gradeFloats.count - 1) {
            if gradeFloats[i] > 150.0 {
                errorLabel()
                return false
            }
            currentGradeTotal += gradeFloats[i] * (weightFloats[i]/100.0)
            totalPercentage += weightFloats[i]
        }
        if totalPercentage > 100.0 {
            errorLabel()
            self.currentGradeLabel.text = "weights > 100%"
            self.currentGradeLabel.textColor = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            self.currentGradeLabel.isHidden = false
            return false
        }
        let multiplier = 100.0 / totalPercentage
        currentGrade = currentGradeTotal * multiplier
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for grade in self.grades {
            grade.keyboardType = UIKeyboardType.decimalPad
        }
        for weight in self.weights {
            weight.keyboardType = UIKeyboardType.decimalPad
        }
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        // ya
        // Do any additional setup after loading the view.
    }
    
    
}
