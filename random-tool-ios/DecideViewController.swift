//
//  DecideViewController.swift
//  random-tool-ios
//
//  Created by Darius Vilcinskis on 07/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import UIKit

class DecideViewController: UIViewController {

    //MARK: actions
    @IBAction func decide(_ sender: UIButton) {
        let decision = Int(arc4random()) % 2 == 1
        
        if decision {
            answerLabel.text = "Yes"
        }
        else {
            answerLabel.text = "No"
        }
        
        answerLabel.isHidden = false
    }
    
    //MARK: outlets
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
