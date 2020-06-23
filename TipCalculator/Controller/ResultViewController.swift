//
//  ResultViewController.swift
//  TipCalculator
//
//  Created by Jamie on 2020/06/23.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultText: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        totalLabel.text = resultText 
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    

}
