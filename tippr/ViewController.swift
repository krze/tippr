//
//  ViewController.swift
//  tippr
//
//  Created by iKreb Retina on 8/22/15.
//  Copyright (c) 2015 krze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tipConstants = SettingsConstants()
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        userDefaults.synchronize()
        // Preserves the state of the temporary tip
        if TemporaryTip.sharedInstance.tipWasChanged {
            self.tipControl.selectedSegmentIndex = TemporaryTip.sharedInstance.temporaryTipValue
        }
        // Sets the tip to the default tip if you have not set a temporary tip
        if ((userDefaults.objectForKey("default_tip") != nil) && !TemporaryTip.sharedInstance.tipWasChanged)  {
            self.tipControl.selectedSegmentIndex = userDefaults.objectForKey("default_tip") as! Int
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentage = tipConstants.percentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        TemporaryTip.sharedInstance.tipWasChanged = true
        TemporaryTip.sharedInstance.temporaryTipValue = tipControl.selectedSegmentIndex
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }


}

