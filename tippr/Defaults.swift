//
//  Defaults.swift
//  tippr
//
//  Created by iKreb Retina on 8/23/15.
//  Copyright (c) 2015 krze. All rights reserved.
//

import Foundation

class Defaults {
    var tipWasChanged = false
    static let sharedInstance = Defaults()
}

class TemporaryTip {
    var tipWasChanged = false
    var temporaryTipValue = 0
    static let sharedInstance = TemporaryTip()
}

class TemporaryBill {
    var valueWasChanged = false
    static let sharedInstance = TemporaryBill()
}