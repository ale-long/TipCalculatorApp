//
//  SettingsViewController.swift
//  tip
//
//  Created by Alex Long  on 8/16/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController:


    UIViewController {

    @IBOutlet weak var DefaultTipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("view will appear")
    DefaultTipControl.selectedSegmentIndex = defaults.integer(forKey:"tip_index")
    // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        // update current tip index in the settings viewer
    }
    
    @IBAction func defaultTipChange(_ sender: Any) {
        defaults.set(DefaultTipControl.selectedSegmentIndex, forKey:"tip_index")
        print(String(DefaultTipControl.selectedSegmentIndex))
        defaults.synchronize()
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
