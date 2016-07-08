//
//  ActivityViewController.swift
//  BoreDDealer
//
//  Created by Yang Song on 7/5/16.
//  Copyright © 2016 WhenYouBored. All rights reserved.
//

import UIKit

class ShortActivityViewController: UIViewController {

    @IBOutlet weak var shortActivityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomShortAct = Activity(title: "Title is Me!!", duration: .ThirtyMin)
        shortActivityLabel.text = randomShortAct.pickActivity(1)
        
    }
}
