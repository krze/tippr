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

    override func viewDidLoad() {
        super.viewDidLoad()
//        var currentDefaultTipIndex = defaults.objectForKey("default_tip") as! Int
//        if let defaultTipSegment = self.defaultTipControl {
//            defaultTipSegment.selectedSegmentIndex = currentDefaultTipIndex
//        }
        var yep = defaults.objectForKey("default_tip")
        println("Current selected index is \(yep)")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var selectedIndex = defaultTipControl.selectedSegmentIndex
        println("Current selected index is \(selectedIndex)")
        defaults.setInteger(selectedIndex, forKey: "default_tip")
        defaults.synchronize()
        println("Saved selected index is \(selectedIndex)")
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
