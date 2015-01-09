//
//  ViewController.swift
//  tipster
//
//  Created by Sathya Srinivasan on 1/8/15.
//  Copyright (c) 2015 iosapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the initial value of Tip and Total Labels to $0.00
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // This method is to update the total whenever the tip or bill amount is changed. We are binding this method to text field's edit change event as well as segmented control's selection changed event
    @IBAction func onValueChanged(sender: AnyObject) {
        // Since swift doesn't have toDouble we are casting the textField value 
        // as NSString and using Objective-C syntax to convert to double
        
        var billAmount = (billField.text as NSString).doubleValue
        var tipPercentages = [0.10,0.15,0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tipAmount = billAmount * tipPercentage
        var totalAmount = billAmount + tipAmount
        
        // Formatting the totalAmount and tipAmount and setting it back to the labels
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

