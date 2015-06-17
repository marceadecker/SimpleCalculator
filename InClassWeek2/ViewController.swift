//
//  ViewController.swift
//  InClassWeek2
//
//  Created by Marcea Decker on 2/10/15.
//  Copyright (c) 2015 md. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Primative Global Variables
    var stringValue:String! = ""
    var totalNumberValue = 0 // cast as Int type
    var mode:Int = 0
    var lastButtonWasMode: Bool = false
    
    //UI Outlets
    //IB Interface Builder, @ denotes special data type
    @IBOutlet weak var myLabel: UILabel!
    
    
    // UI Actions
    @IBAction func numberPress(sender: UIButton) {
        
        var myString = sender.titleLabel?.text
        var num:Int! = myString?.toInt()
        if (num == 0 && totalNumberValue == 0)
        {
            return
        }
        
        if (lastButtonWasMode)
        {
            lastButtonWasMode = false
            stringValue = ""
        }
        
        stringValue = stringValue.stringByAppendingString(myString!)
        myLabel.text = stringValue
        
        if (totalNumberValue == 0)
        {
            totalNumberValue = stringValue.toInt()!
        //converting string text from buttons into integers that can +/-/x
            
        }
        
        println("Number Value = \(totalNumberValue)")
        println("button Pressed")
        
    }
    
    @IBAction func clearButtonPressed(sender: UIButton) {
        totalNumberValue = 0
        mode = 0
        stringValue = ""
        myLabel.text = "0"
        lastButtonWasMode = false
    }
    
    @IBAction func pressPlus(sender: UIButton) {
        self.setMode (1)
        
        
    }
    
    
    @IBAction func pressMinus(sender: UIButton) {
        self.setMode (-1)
    }
    
    
    @IBAction func pressMultiply(sender: UIButton) {
        self.setMode (2)
    }
    
    @IBAction func pressEquals(sender: UIButton) {
        if (mode == 0)
        {
            return
        }
        var iNum:Int = stringValue.toInt()!
        if (mode == 1)
        {
            totalNumberValue += iNum
        }
        if (mode == -1)
        {
            totalNumberValue -= iNum
        }
        
        if (mode == 2)
        {
            totalNumberValue *= iNum
        }
        stringValue = "\(totalNumberValue)"
        myLabel.text = stringValue
        mode = 0
    }
    
    func setMode (m:Int) {
        if (totalNumberValue == 0)
        {
            return
        }
        mode = m
        lastButtonWasMode = true
        totalNumberValue = stringValue.toInt()!
        
    }
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        myLabel.text = "0"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }


}

