//
//  SettingsViewController.swift
//  tippr
//
//  Created by iKreb Retina on 8/22/15.
//  Copyright (c) 2015 krze. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var userDefaults = NSUserDefaults.standardUserDefaults()
    let tipConstants = SettingsConstants()
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        // On loading the view, confirms that the user has not changed defaults
        Defaults.sharedInstance.tipWasChanged = false
        // Checks to see if there is a default tip. If it's nil it sets it to the current default index to avoid a crash.
        var currentDefaultTipIndex = Int()
        if (userDefaults.objectForKey("default_tip") != nil) {
            currentDefaultTipIndex = userDefaults.objectForKey("default_tip") as! Int
        }
        // If the default tip is not the selected tip, it sets the default tip to the right index to indicate the default tip.
        if (currentDefaultTipIndex != defaultTipControl.selectedSegmentIndex) {
            self.defaultTipControl.selectedSegmentIndex = currentDefaultTipIndex
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onEditingChanged(sender: AnyObject) {
        // Sets the newly chosen value as the default tip in NSUserDefaults and syncs
        var selectedIndex = defaultTipControl.selectedSegmentIndex
        // Indicates that the user did change defaults
        Defaults.sharedInstance.tipWasChanged = true
        userDefaults.setInteger(selectedIndex, forKey: "default_tip")
        userDefaults.synchronize()
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
