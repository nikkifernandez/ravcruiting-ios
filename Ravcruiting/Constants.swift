//
//  Constants.swift
//  Ravcruiting
//
//  Created by Nikki Fernandez on 09/03/2017.
//  Copyright © 2017 SourcePad. All rights reserved.
//

import UIKit

let ScreenWidth: CGFloat    = UIScreen.main.bounds.size.width
let ScreenHeight: CGFloat    = UIScreen.main.bounds.size.height

let APIBaseURL  = ""
let APIHeaders  = ""

// MARK: COLORS
func UIColorFromHEX(_ colorCode: String, alpha: Float = 1.0) -> UIColor {
    let scanner = Scanner(string: colorCode)
    var color: UInt32 = 0
    scanner.scanHexInt32(&color)
    
    let mask = 0x000000FF
    let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
    let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
    let b = CGFloat(Float(Int(color) & mask)/255.0)
    
    return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
}

let ColorThemePink      = UIColorFromHEX("FFA69E")
let ColorThemeYellow    = UIColorFromHEX("FAF3DD")
let ColorThemeGreen     = UIColorFromHEX("B8F2E6")
let ColorThemeBlue      = UIColorFromHEX("AED9E0")
let ColorThemeGray      = UIColorFromHEX("5E6472")
let ColorThemeDisabledGreen = UIColorFromHEX("E1F4F0")


let ColorThemeLightText = UIColorFromHEX("d3d3d3")
let ColorThemeDarkText  = UIColorFromHEX("5E6472")

// MARK: FONTS

let FontListMainText    = UIFont(name: "AvenirNext-Bold", size: 16.0)
let FontListBoldSubText = UIFont(name: "AvenirNext-Bold", size: 14.0)
let FontListSubText     = UIFont(name: "Avenir", size: 14.0)
let FontButtonText      = UIFont(name: "AvenirNext-Bold", size: 18.0)
let FontBoldText        = UIFont(name: "AvenirNext-Bold", size: 18.0)
let FontSmallBoldText   = UIFont(name: "AvenirNext-Bold", size: 16.0)
let FontRegularText     = UIFont(name: "Avenir", size: 16.0)
let FontBigText         = UIFont(name: "Avenir", size: 18.0)
