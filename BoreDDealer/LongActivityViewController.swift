//
//  LongActivityViewController.swift
//  BoreDDealer
//
//  Created by Brittiny Tran on 7/8/16.
//  Copyright © 2016 WhenYouBored. All rights reserved.
//

import UIKit

class LongActivityViewController: UIViewController {


    @IBAction func moreOptionsLong(sender: AnyObject) {
        let randomLongAct = Activity(title: "Title is Me!!", duration: .SixtyMin)
        longActivityLabel.text = randomLongAct.pickActivity(2)
    }
    
    @IBOutlet weak var longActivityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomLongAct = Activity(title: "Title is Me!!", duration: .SixtyMin)
        longActivityLabel.text = randomLongAct.pickActivity(2)
        
        // Do any additional setup after loading the view.
    }

    
}
