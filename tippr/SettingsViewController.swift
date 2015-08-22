//
//  SettingsViewController.swift
//  tippr
//
//  Created by iKreb Retina on 8/22/15.
//  Copyright (c) 2015 krze. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var defaults = NSUserDefaults.standardUserDefaults()
    let tipConstants = SettingsConstants()
    
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        if (defaults.objectForKey("default_tip") != nil) {
            self.defaultTipControl.selectedSegmentIndex = defaults.objectForKey("default_tip") as! Int
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var selectedIndex = defaultTipControl.selectedSegmentIndex
        defaults.setInteger(selectedIndex, forKey: "default_tip")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */


}
