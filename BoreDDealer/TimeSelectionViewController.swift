//
//  TimeSelectionViewController.swift
//  BoreDDealer
//
//  Created by Yang Song on 7/5/16.
//  Copyright © 2016 WhenYouBored. All rights reserved.
//

import UIKit

class TimeSelectionViewController: UIViewController {

    
    @IBAction func tap30Min(sender: AnyObject) {
        let activity = Activity(title: "", duration: ActivityDuration.ThirtyMin)
        activity.pickActivity(1)
    
    }
    @IBAction func tap1Hr(sender: AnyObject) {
        let activity2 = Activity(title: "", duration: ActivityDuration.SixtyMin)
        activity2.pickActivity(2)
    }

    
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

}
