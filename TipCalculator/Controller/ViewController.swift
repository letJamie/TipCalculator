//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jamie on 2020/06/22.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var resultTo2DecimalPlaces: String = ""
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        tip = buttonTitleAsANumber / 100
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        
        let bill = billTextField.text ?? ""
        
        if  bill != "" {
            
            billTotal = Double(bill) ?? 0.0
        }
        
        let payPerPerson = billTotal * (1 + tip) / Double(numberOfPeople)
        
        resultTo2DecimalPlaces = String(format: "%.2f", payPerPerson)
        
        //print(resultTo2DecimalPlaces)
        
        self.performSegue(withIdentifier: "goToNext", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNext" {
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.resultText = resultTo2DecimalPlaces
            
            
        }
    }
}

