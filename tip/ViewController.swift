//
//  ViewController.swift
//  tip
//
//  Created by Alex Long  on 8/15/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel:
    UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // Retrieve default tip percentage from UserDefaults and update tip amount
        let defaultTip = defaults.integer(forKey:"defaultTip_index")
        tipControl.selectedSegmentIndex = defaultTip
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
       
       // Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
       
        let tip = bill * tipPercentages[defaultTip]
        let total = bill + tip
       
       // Update the tip and total labels
        tipLabel.text = String(format: "$%0.2f", tip )
        totalLabel.text = String(format: "$%0.2f", total)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        // update current tip index in the settings viewer
        defaults.set(tipControl.selectedSegmentIndex, forKey:"setting_index")
    }
    override func viewDidDisappear(_ animated: Bool) {
           super.viewDidDisappear(animated)
           print("view did disappear")
       }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%0.2f", tip )
        totalLabel.text = String(format: "$%0.2f", total)
    }
}

