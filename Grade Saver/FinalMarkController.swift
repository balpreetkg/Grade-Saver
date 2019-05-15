//
//  FinalMarkController.swift
//  Grade Saver
//
//  Created by Balpreet on 2019-05-07.
//  Copyright © 2019 Ballu. All rights reserved.
//

import UIKit

class FinalMarkController: UIViewController {
    
    var markNeeded = ""
    
    @IBOutlet weak var currentGradeTextField: UITextField!
    
    @IBOutlet weak var desiredGradeTextField: UITextField!
    
    @IBOutlet weak var examWeightTextField: UITextField!
    
    @IBOutlet var hiddenLabels:[UILabel]!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func pressedNo(_ sender: UIButton) {
        self.performSegue(withIdentifier: "FinalToCurrentSegue", sender: self)
    }
    
    @IBAction func pressedYes(_ sender: UIButton) {
        for label in hiddenLabels {
            label.isHidden = false
        }
        desiredGradeTextField.isHidden = false
        currentGradeTextField.isHidden = false
        examWeightTextField.isHidden = false
        submitButton.isHidden = false
    }
    
    @IBAction func pressedSubmit(_ sender: UIButton) {
        if tryCalculation() {
            self.performSegue(withIdentifier: "FinalMarkToSecondViewSegue", sender: self)
        }
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "FinalToMainSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "FinalMarkToSecondViewSegue") {
            let vc = segue.destination as! GiveFinalViewController
            vc.markNeededOnFinal = self.markNeeded
        }
    }
    
    func errorCheck() -> Bool {
        if currentGradeTextField.text!.isEmpty || desiredGradeTextField.text!.isEmpty || examWeightTextField.text!.isEmpty || Float(examWeightTextField.text!)! > 100.0 {
            errorLabel.isHidden = false
            return true
        } else {
            return false
        }
    }
    
    func tryCalculation() -> Bool {
        if errorCheck() {
            return false
        }
        let examWeightDecimal = Float(examWeightTextField.text!)! / 100.0
        let remainder = 1.0 - examWeightDecimal
        var markNeededFloat = Float(currentGradeTextField.text!)! * remainder
        markNeededFloat = Float(desiredGradeTextField.text!)! - markNeededFloat
        markNeededFloat = markNeededFloat / examWeightDecimal
        self.markNeeded = String(markNeededFloat)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desiredGradeTextField.keyboardType = UIKeyboardType.decimalPad
        currentGradeTextField.keyboardType = UIKeyboardType.decimalPad
        examWeightTextField.keyboardType = UIKeyboardType.decimalPad
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        // Do any additional setup after loading the view.
    }
    
    
}
