//
//  SettingsViewController.swift
//  tipster
//
//  Created by Sathya Srinivasan on 1/9/15.
//  Copyright (c) 2015 iosapps. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var defaultTipPercentage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onSave(sender: AnyObject) {
        // Sets the default value for tip percentage. If the text field value is not populated defaulting it to 10%
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var defaultTipPercentageString:String
        if (defaultTipPercentage.text == nil || defaultTipPercentage.text == ""){
            defaultTipPercentageString="10"
        } else {
            defaultTipPercentageString=defaultTipPercentage.text
        }
        
        defaults.setDouble((defaultTipPercentageString as NSString).doubleValue / 100, forKey: "defaultTipPercent")
        defaults.synchronize()
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
