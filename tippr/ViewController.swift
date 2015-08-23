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
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewWillAppear(animated: Bool) {
        // I want to put in a check here where, if the default was not changed since the last time this view was loaded, it won't change the segmented control for tip on this screen. Therefore, if you change the tip value on this view, go to settings, don't change the default, then return back to the main view, the value is not reset to the default value
        
        // If the default tip is not nil, it will set the value to the saved default tip.
        super.viewWillAppear(true)
        if (defaults.objectForKey("default_tip") != nil)  {
            self.tipControl.selectedSegmentIndex = defaults.objectForKey("default_tip") as! Int
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
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }


}

